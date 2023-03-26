//
//  ConfirmOrderView.swift
//  Birmingham
//
//  Created by Aleksey Nosik on 18.03.2023.
//

import SwiftUI

struct ConfirmOrderView: View {
    @Environment(\.dismiss) var dismiss
    @State private var isPresentConfirmOrder = false
    
    @ObservedObject var table: Order
    @Binding var helpTable: Order
    
    var body: some View {
        VStack {
            InfoOrderView(table: helpTable)
            
            if helpTable.dishes.count > 0 {
                Button {
                    isPresentConfirmOrder.toggle()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 50)
                            .fill(.myBrownColor)
                            .frame(width: 300, height: 60)
                        
                        HStack(alignment: .center) {
                            Text("Add dishes to the check")
                                .font(.title3)
                                .foregroundColor(.white)
                            
                            ZStack {
                                Image(systemName: "basket.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                
                                Image(systemName: "\(helpTable.dishes.count).circle.fill")
                                    .resizable()
                                    .frame(width: 20, height: 20, alignment: .bottomTrailing)
                                    .foregroundColor(.black)
                            }
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                        }
                    }
                }
                .alert("Сonfirm adding dishes to the check?", isPresented: $isPresentConfirmOrder) {
                    Button("Cancel", role: .destructive, action: cancel)
                    Button("OK") {
                        table.dishes += helpTable.dishes
                        MyHistoryView.currentOrders.append(table)
                        helpTable.dishes = []
                        cancel()
                    }
                }
            }
        }
    }
    
    private func cancel() {
        dismiss()
    }
}

//struct ConfirmOrderView_Previews: PreviewProvider {
//    static var previews: some View {
//        ConfirmOrderView(table: Order(), helpTable: Order())
//    }
//}
