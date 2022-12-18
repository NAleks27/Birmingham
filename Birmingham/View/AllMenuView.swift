//
//  AllMenuView.swift
//  Birmingham
//
//  Created by Aleksey Nosik on 17.12.2022.
//

import SwiftUI

struct AllMenuView: View {
   
    var allMenuArray = [Dish]()
    
    var body: some View {
        NavigationView {
            ScrollView {
                DishView(dishh: Dish(name: "Caesar", image: "salad1", description: "Something", price: 150))
                Spacer()
            }
            .navigationTitle("ALL MENU")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct AllMenuView_Previews: PreviewProvider {
    static var previews: some View {
        AllMenuView()
    }
}
