//
//  AllMenuView.swift
//  Birmingham
//
//  Created by Aleksey Nosik on 17.12.2022.
//

import SwiftUI

struct AllMenuView: View {
   
    let dishTest = Dish(
        name: "Caesar",
        image: "caesar",
        description: "Tasty salad. Tasty salad. Tasty salad. Tasty salad. Tasty salad. Tasty salad. Tasty salad. Tasty salad. Tasty salad.",
        price: 150,
        likes: 220)
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                DishView()
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
