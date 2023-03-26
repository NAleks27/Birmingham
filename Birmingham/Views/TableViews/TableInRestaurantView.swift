//
//  TableInRestaurant.swift
//  Birmingham
//
//  Created by Aleksey Nosik on 01.03.2023.
//

import SwiftUI

struct TableInRestaurant: View {
    @StateObject var table = Order()
    
    let numbersOfTables = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    
    var body: some View {
        VStack {
            Picker("Number of table", selection: $table.number) {
                ForEach(numbersOfTables, id: \.self) { number in
                    Text("\(number)")
                        .foregroundColor(.myBrown)
                }
            }
            .pickerStyle(.wheel)
            
            Button {
                // ---------------
            } label: {
                NavigationLink("OK", destination: MyTableMainView(table: table))
            }
            .buttonStyle(.bordered)
            .foregroundColor(.myBrown)
        }
        
    }
}

struct TableInRestaurant_Previews: PreviewProvider {
    static var previews: some View {
        TableInRestaurant()
    }
}
