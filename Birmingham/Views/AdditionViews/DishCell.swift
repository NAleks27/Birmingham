//
//  DishCell.swift
//  Birmingham
//
//  Created by Aleksey Nosik on 23.02.2023.
//

import SwiftUI

struct DishCell: View {
    @ObservedObject var order: Order
    @ObservedObject var dish: Dish
    
    var body: some View {
        Section {
            HStack (alignment: .center, spacing: 10) {
                Image(dish.image)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                
                
                VStack(alignment: .leading, spacing: 0) {
                    Text(dish.name)
                        .font(.title2)
                    
                    
                    Text(dish.composition)
                        .font(.caption)
                        .frame(width: 150, height: 70)
                        .padding(.bottom, 10)
                }
                
                VStack {
                    Text("\(dish.price) UAH")
                        .font(.title3)
                    
                    HStack {
                        if dish.amount > 0 && order.dishes.count != 0 {
                            Button {
                                deleteDish(dish: dish)
                            } label: {
                                ZStack {
                                    Image(systemName: "circle.fill")
                                        .resizable()
                                        .frame(width: 30, height: 30, alignment: .bottomTrailing)
                                        .foregroundColor(.myBrown).opacity(0.7)
                                    
                                    Text("-")
                                        .font(.title2)
                                        .foregroundColor(.white)
                                }
                            }
                            
                            Text("\(dish.amount)")
                                .foregroundColor(.black)
                        }
                        
                        Button {
                            addDish(dish: dish)
                        } label: {
                            ZStack {
                                Image(systemName: "circle.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30, alignment: .bottomTrailing)
                                    .foregroundColor(.myBrown)
                                
                                Text("+")
                                    .font(.title2)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .frame(width: 100, height: 40)
                }
            }
            .frame(width: 380, height: 120)
        }
    }
    
    func deleteDish(dish: Dish) {
        dish.amount -= 1
        order.sum -= dish.price
        order.dishes.removeLast()
        
        if dish.amount < 1 {
            dish.amount = 0
        }
    }
    
    func addDish(dish: Dish) {
        dish.amount += 1
        order.sum += dish.price
        order.dishes.append(dish)
    }
}

struct DishCell_Previews: PreviewProvider {
    static var previews: some View {
        DishCell(order: Order(), dish: Dish.sampleDish)
    }
}
