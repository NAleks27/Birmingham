//
//  MainView.swift
//  Birmingham
//
//  Created by Aleksey Nosik on 23.02.2023.
//

import SwiftUI

struct MainView: View {
    @State private var isPresentHistory = false
    
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
                
                Group {
                    VStack {
                        ButtonsMainScreen(text: "My tables and orders",
                                          view: "MyHistoryView",
                                          width: 340,
                                          height: 50,
                                          radius: 15,
                                          fontSize: 20)
                        
                        HStack(spacing: 30) {
                            ButtonsMainScreen(text: "Table\nreserv",
                                              view: "ReservationView")
                            
                            ButtonsMainScreen(text: "Take\naway",
                                              view: "TakeAwayView")
                        }
                        .padding(.bottom, 20)
                        
                        HStack(spacing: 30) {
                            ButtonsMainScreen(text: "Enter table number",
                                              view: "TableInRestaurant")
                            
                            ButtonsMainScreen(text: "Contacts",
                                              view: "Contacts")
                        }
                        
                        Spacer()
                        
                        HStack (spacing: 15) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(.white)
                                    .frame(width: 230, height: 80)
                                
                                VStack(alignment: .leading) {
                                    Text("Wi-Fi:")
                                        .font(.title2)
                                    
                                    Text("Name: Birmingham")
                                    Text("Password: birminghamPub")
                                }
                                .foregroundColor(.white)
                            }
                            
                            Button {
                                copying()
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(.brown).brightness(-0.3)
                                        .frame(width: 80, height: 80)
                                    
                                    Text("Copy")
                                        .font(.title3)
                                }
                                .foregroundColor(.white)
                            }
                        }
                    }
                }
            }
            .navigationTitle("BIRMINGHAM")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func copying() {
        let copying = UIPasteboard.general
        copying.string = "birminghamPub"
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
