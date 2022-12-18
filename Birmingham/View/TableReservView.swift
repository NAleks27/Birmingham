//
//  TableReserv.swift
//  Birmingham
//
//  Created by Aleksey Nosik on 16.12.2022.
//

import SwiftUI


struct Table: View {
    @State private var tapBtn = false
   
    var text: Int

    var body: some View {
        ZStack {
            if text % 3 == 0 {
                Button {
                    tapBtn.toggle()
                } label: {
                    RoundedRectangle(cornerRadius: 50)
                        .fill(tapBtn ? .green : .brown)
                        .frame(width: 120, height: 60)
                }
                .onTapGesture {
                    
                }
            } else {
                Button {
                    //code
                } label: {
                    RoundedRectangle(cornerRadius: 50)
                        .fill(.gray)
                        .frame(width: 120, height: 60)
                }
                .disabled(true)
            }
//
//            Button {
//                tapBtn.toggle()
//            } label: {
//                if text % 3 == 0 {
//                    RoundedRectangle(cornerRadius: 50)
//                        .fill(.gray)
//                        .frame(width: 120, height: 60)
//                } else {
//                    RoundedRectangle(cornerRadius: 50)
//                        .fill(color)
//                        .frame(width: 120, height: 60)
//                }
//            }
//            .disabled(text % 3 == 0 ? true : false)
            
            Text("Table \(text)")
                .foregroundColor(.white)
        }
    }
}


struct TableReservView: View {
    @State private var tableNumber = 12
    @State private var isPresenOrdered = false
    @Environment(\.dismiss) var dismiss
    
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
                                .onTapGesture {
                                    tableNumber = number
                                }
                        }
                    }
                }
                
                Spacer()
                
                Button {
                    isPresenOrdered.toggle()
                } label: {
                    ZStack {
                        Rectangle()
                            .fill(.green)
                            .frame(height: 50)
                        
                        Text("To order \"Table №\(tableNumber)\"")
                            .foregroundColor(.white)
                    }
                }
                .alert("Ordered \"Table\"\(tableNumber)", isPresented: $isPresenOrdered) {
                    Button("OK", role: .cancel, action: cancel)
                }
            }
            .navigationTitle("TABLE RESERV")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    func cancel() {
        dismiss()
    }
}

struct TableReservView_Previews: PreviewProvider {
    static var previews: some View {
        TableReservView()
    }
}
