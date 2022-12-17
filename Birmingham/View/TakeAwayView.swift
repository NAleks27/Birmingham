//
//  TakeAwayView.swift
//  Birmingham
//
//  Created by Aleksey Nosik on 17.12.2022.
//

import SwiftUI

struct TakeAwayView: View {
    
    let menuSections = ["NEW", "POPULAR", "All menu", "Main dishes", "First dishes", "Salads", "Desserts", "Hot drinks", "Cold drinks"]
    
    var body: some View {
        NavigationView {
            VStack {
                List(menuSections, id: \.self) { group in
                    NavigationLink {
                        AllMenuView()
                    } label: {
                        Text(group)
                    }
                }
                .listStyle(.inset)
                
                Section {
                    HStack {
                        Text("Check sum:")
                        Spacer()
                        Text("450 uah")
                    }
                    .foregroundColor(.black)
                    .padding()
                }
                
                Button {
                    
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 50)
                            .fill(.brown)
                            .frame(width: 300, height: 60)
                        
                        HStack(alignment: .center) {
                            Text("Go to order")
                                .font(.title3)
                                .foregroundColor(.white)
                            
                            ZStack {
                                Image(systemName: "basket.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                
                                Image(systemName: "\(5).circle.fill")
                                    .resizable()
                                    .frame(width: 20, height: 20, alignment: .bottomTrailing)
                                    .foregroundColor(.black)
                            }
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                        }
                    }
                }
                
                
            }
            .foregroundColor(.brown)
            .navigationTitle("TAKE AWAY")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct TakeAwayView_Previews: PreviewProvider {
    static var previews: some View {
        TakeAwayView()
    }
}
