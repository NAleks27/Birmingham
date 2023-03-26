//
//  TableReservView.swift
//  Birmingham
//
//  Created by Aleksey Nosik on 24.02.2023.
//

import SwiftUI

struct TableReserve: View {
    var tapBtn: Bool
    @State var number: Int

    var body: some View {
        ZStack {
            if number % 3 == 0 {
                ZStack {
                    Image("Table")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .brightness(-0.3)
                                        
                    Text("Table \(number)")
                        .foregroundColor(.white)
                }
            } else {
                ZStack {
                    Image("Table")
                        .resizable()
                        .frame(width: 120, height: 120)
                    
                    Text("Table \(number)")
                        .foregroundColor(.white)
                }
            }
        }
    }
}


struct ReservationView: View {
    @Environment(\.dismiss) var dismiss
    @State private var isPresenOrdered = false
    @State private var tapBtn = false
    @State private var color: Color = .myBrownColor
    @State var tableNumber = 0
    
    let columns = [
        GridItem(.adaptive(minimum: 180))
    ]
        
    var body: some View {
        NavigationView {
            ZStack {
                Image("MainPhoto")
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()
                    .padding(.leading, 55)
                
                Color.black
                    .opacity(0.8)
                
                VStack {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(1..<11) { number in
                                if number % 3 == 0 {
                                    Button {
                                        tableNumber = number
                                    } label: {
                                        TableReserve(tapBtn: tapBtn, number: number)
                                    }
                                    .disabled(true)
                                } else {
                                    Button {
                                        tableNumber = number
                                        tapBtn = true
                                    } label: {
                                        TableReserve(tapBtn: tapBtn, number: number)
                                    }
                                }
                            }
                        }
                    }
                    
                    Spacer()
                    
                    Button {
                        let table = Order()
                        table.number = tableNumber
                        MyHistoryView.currentOrders.append(table)
                        isPresenOrdered.toggle()
                    } label: {
                        ZStack {
                            Rectangle()
                                .fill(.green)
                                .frame(height: 50)
                            
                            Text(tapBtn ? "To order \"Table №\(tableNumber)\"" : "Chose table")
                                .foregroundColor(.white)
                        }
                    }
                    .disabled(tableNumber == 0 ? true : false)
                    .alert("Ordered \"Table\"\(tableNumber)", isPresented: $isPresenOrdered) {
                        Button("OK", role: .cancel, action: cancel)
                    }
                }
            }
            .navigationTitle("TABLE RESERV")
            .foregroundColor(.white)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    func cancel() {
        dismiss()
    }
}

struct TableReservView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationView()
    }
}
