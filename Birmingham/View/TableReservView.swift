//
//  TableReserv.swift
//  Birmingham
//
//  Created by Aleksey Nosik on 16.12.2022.
//

import SwiftUI


struct Table: View {
    
    var text: Int
    
    var body: some View {
        ZStack {
            if text == 12 {
                Button {
                    // some code
                } label: {
                    RoundedRectangle(cornerRadius: 50)
                        .fill(.green)
                        .frame(width: 120, height: 60)
                }
            } else {
                Button {
                    // some code
                } label: {
                    RoundedRectangle(cornerRadius: 50)
                        .fill(text % 3 == 0 ? .brown : .gray)
                        .frame(width: 120, height: 60)
                }
            }
            
            Text("Table \(text)")
                .foregroundColor(.white)
        }
    }
}

struct TableReservView: View {

//    @State private var isPresenOrdered = false
    @State private var numberOfTable = 12

    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                Group {
                    Divider()
                    HStack(spacing: 100) {
                        HStack {
                            Rectangle()
                                .fill(.brown)
                                .frame(width: 20, height: 20)
                            
                            Text("- free")
                        }
                        
                        HStack {
                            Rectangle()
                                .fill(.gray)
                                .frame(width: 20, height: 20)
                            
                            Text("- reserved")
                        }
                    }
                    
                    Divider()
                        .padding(.bottom, 10)
                }
                
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(1..<15) { number in
                            Table(text: number)
                        }
                    }
                }
                
                Spacer()
                
                Button {
                    //some code
                } label: {
                    ZStack {
                        Rectangle()
                            .fill(.green)
                            .frame(height: 50)
                        
                        Text("To order \"Table №12\"")
                            .foregroundColor(.white)
                    }
                }
            }
            .navigationTitle("TABLE RESERV")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct TableReservView_Previews: PreviewProvider {
    static var previews: some View {
        TableReservView()
    }
}
