//
//  MyTableInfoView.swift
//  Birmingham
//
//  Created by Aleksey Nosik on 04.03.2023.
//

import SwiftUI

struct MyTableInfoView: View {
    @Environment(\.dismiss) var dismiss
    @State private var isPresentClosedTable = false
    @ObservedObject var table: Order
    
    var body: some View {
        VStack {
            InfoOrderView(table: table)
            
            Group {
                Button {
                    isPresentClosedTable.toggle()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 50)
                            .fill(.myBrownColor)
                            .frame(width: 300, height: 60)
                        
                        HStack(alignment: .center) {
                            Text("Pay check & close table")
                                .font(.title3)
                                .foregroundColor(.white)
                            
                            ZStack {
                                Image(systemName: "basket.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                
                                Image(systemName: "\(table.dishes.count).circle.fill")
                                    .resizable()
                                    .frame(width: 20, height: 20, alignment: .bottomTrailing)
                                    .foregroundColor(.black)
                            }
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                        }
                    }
                }
                .alert("Are you sure?", isPresented: $isPresentClosedTable) {
                    Button("Cancel", role: .destructive, action: cancel)
                    Button("OK", role: .cancel) {
                        table.status = .Closed
                        MyHistoryView.archiveOrders.append(table)
                        cancel()
                    }
                } message: {
                    Text("Pay and close the table.")
                }
            }
        }
    }
    
    private func cancel() {
        dismiss()
    }
}

struct MyTableInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MyTableInfoView(table: Order())
    }
}
