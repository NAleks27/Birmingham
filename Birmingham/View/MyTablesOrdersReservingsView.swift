//
//  MyTablesOrdersReservings.swift
//  Birmingham
//
//  Created by Aleksey Nosik on 16.12.2022.
//

import SwiftUI

struct MyTablesOrdersReservingsView: View {
    @State private var pickerChoice = "Current"
    @State private var isPresentDetailView = false
    
    var historyOfOrders = ["Table", "Order", "Reserving"]
    let currentOrArchive = ["Current", "Archive"]
    
    var body: some View {
        NavigationView {
            VStack (spacing: 10) {
                Picker("Current or Archive", selection: $pickerChoice) {
                    ForEach(currentOrArchive, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                .frame(width: 300)
                .padding(.bottom, 15)
                
                
                if pickerChoice == "Current" {
                    ForEach(historyOfOrders, id: \.self) { item in
                        Button {
                            isPresentDetailView.toggle()
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(.brown)
                                    .frame(width: 350, height: 100)
                                
                                HStack (spacing: 30) {
                                    Text(item)
                                        .foregroundColor(.white)
                                        .font(.title)
                                    
                                    
                                    VStack (alignment: .leading) {
                                        Text("Date: 15.12.2022")
                                        Text("Check sum:\n450 uah")
                                            .multilineTextAlignment(.leading)
                                    }
                                    .foregroundColor(.white)
                                }
                            }
                        }
                        .sheet(isPresented: $isPresentDetailView) {
//                            DetailView()
                        }
                    }
                }
                
                Spacer()
            }
            .navigationTitle("MY TABLES, ORDERS, RESERVINGS")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct MyTablesOrdersReservingsView_Previews: PreviewProvider {
    static var previews: some View {
        MyTablesOrdersReservingsView()
    }
}
