//
//  MyTableMainView.swift
//  Birmingham
//
//  Created by Aleksey Nosik on 21.12.2022.
//

import SwiftUI

struct MyTableMainView: View {
    @Environment(\.dismiss) var dismiss
    @State private var isCallingWaiter = false
    @State private var isPresentMyTableInfo = false
    @State private var isPresentConfirmView = false
        
    @ObservedObject var table: Order
    @State var helpTable = Order()
    
    var body: some View {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(.myBrownColor)
                        .frame(width: 400, height: 40)
                    
                    Text("Table \(table.number)")
                        .foregroundColor(.white)
                        .font(.title3)
                }
                
                HStack(spacing: 20) {
                    Button {
                        isCallingWaiter.toggle()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.myBrownColor)
                                .frame(width: 100, height: 50)
                            
                            Text("Waiter 🔔")
                                .foregroundColor(.white)
                                .frame(width: 90)
                        }
                    }
                    .alert("Please wait. The waiter will come as soon as possible.", isPresented: $isCallingWaiter) {
                        Button("OK", role: .cancel) {}
                    }
                    
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.brown)
                            .frame(width: 100, height: 50)
                        
                        Text("Check sum: \(helpTable.sum) UAH")
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .frame(width: 90)
                    }
                    
                    Button {
                        isPresentMyTableInfo.toggle()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.myBrownColor)
                                .frame(width: 100, height: 50)
                            
                            Text("My table")
                                .foregroundColor(.white)
                                .frame(width: 90)
                        }
                    }
                    .sheet(isPresented: $isPresentMyTableInfo) {
                        MyTableInfoView(table: table)
                    }
                }
                
                Divider()
                MenuView(order: helpTable)
                
                Button {
                    helpTable.number = table.number
                    isPresentConfirmView.toggle()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 50)
                            .fill(.myBrownColor)
                            .frame(width: 300, height: 60)
                        
                        HStack(alignment: .center) {
                            Text("Confirm order")
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
                .sheet(isPresented: $isPresentConfirmView) {
                    ConfirmOrderView(table: table, helpTable: $helpTable)
                }
            }
    }
}

struct MyTableMainView_Previews: PreviewProvider {
    static var previews: some View {
        MyTableMainView(table: Order())
    }
}
