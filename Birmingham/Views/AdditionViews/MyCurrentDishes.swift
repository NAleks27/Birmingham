//
//  MyCurrentDishes.swift
//  Birmingham
//
//  Created by Aleksey Nosik on 04.03.2023.
//

import SwiftUI

struct MyCurrentDishes: View {
    @ObservedObject var dish: Dish
    
    var body: some View {
        Section {
            HStack(spacing: 30) {
                Image(dish.image)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                
                Text(dish.name)
                    .frame(width: 60)
                
                Text("\(dish.amount)")
                    .frame(width: 15)
                    .padding(.trailing, 10)
                
                Text("\(dish.price) uah")
                
                Text("\(dish.amount * dish.price) UAH")

            }
            .font(.callout)
        }
        .frame(width: 380, height: 70)
    }
}

struct MyCurrentDishes_Previews: PreviewProvider {
    static var previews: some View {
        MyCurrentDishes(dish: Dish.sampleDish)
    }
}
