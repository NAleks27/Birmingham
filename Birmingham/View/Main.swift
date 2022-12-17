//
//  Main.swift
//  Birmingham
//
//  Created by Aleksey Nosik on 16.12.2022.
//

import SwiftUI

struct Main: View {
    @State private var isPresentHistory = false
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink {
                    MyTablesOrdersReservingsView()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(.brown).brightness(-0.3)
                            .frame(width: 330, height: 50)
                        
                        Text("My tables, orders, reservations")
                            .foregroundColor(.white)
                            .font(.title3)
                    }
                }
                
                
                Spacer()
                
                
                HStack(spacing: 30) {
                    RectangleButton(text: "Table\nreserv", view: "TableReservView")
                    RectangleButton(text: "Take\naway", view: "TakeAwayView")
                }
                
                HStack(spacing: 30) {
                    RectangleButton(text: "QR", subtext: "(scan QR of your table)", view: "QR")
                    RectangleButton(text: "Contacts", view: "Contacts")
                }
                
                Spacer()
                Spacer()
                Spacer()
                
                HStack (spacing: 15) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.brown, lineWidth: 1)
                            .frame(width: 100, height: 40)
                        
                        Text("Wi-Fi")
                            .font(.title2)
                            .foregroundColor(.brown)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Name: Birmingham")
                        Text("Password: 12345678")
                    }
                    .foregroundColor(.brown)
                    
                    Button {
                        //copying
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.brown, lineWidth: 1)
                                .frame(width: 70, height: 35)
                            
                            Text("Copy")
                                .font(.title3)
                                .foregroundColor(.brown)
                        }
                    }
                }
            }
            .navigationTitle("BIRMINGHAM")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}




struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
