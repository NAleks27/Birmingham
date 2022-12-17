//
//  DishView.swift
//  Birmingham
//
//  Created by Aleksey Nosik on 17.12.2022.
//

import SwiftUI

var myLikes = 220

struct DishView: View {
   
    @State private var amountDishes = 0
    @State private var isLike = false
    
    var dish = Dish(
        name: "Caesar",
        image: "caesar",
        description: "Tasty salad. Tasty salad. Tasty salad. Tasty salad. Tasty salad. Tasty salad. Tasty salad. Tasty salad.",
        price: 150)
    
    
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.brown)
                .frame(width: 390, height: 120)
                .cornerRadius(20)
                
            Rectangle()
                .fill(.white)
                .frame(width: 386, height: 116)
                .cornerRadius(20)
            
            HStack (alignment: .center, spacing: 10) {
                Image(dish.image)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                
                
                VStack(alignment: .leading, spacing: 0) {
                    Text(dish.name)
                        .font(.title)
                        
                    
                    Text(dish.description)
                        .font(.caption)
                        .frame(width: 150, height: 70)
                        .padding(.bottom, 10)
                    
                }
                
                
                
                VStack {
                    Text("\(dish.price) uah")
                        .font(.title3)
                    
                    HStack {
                        Button {
                            amountDishes -= 1
                            if amountDishes < 1 {
                                amountDishes = 0
                            }
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(.brown)
                                    .frame(width: 30, height: 30)
                                
                                Text("-")
                                    .font(.title2)
                                    .foregroundColor(.white)
                            }
                        }
                        
                        Text("\(amountDishes)")
                            .foregroundColor(.black)
                            
                        
                        Button {
                            amountDishes += 1
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(.brown)
                                    .frame(width: 30, height: 30)
                                
                                Text("+")
                                    .font(.title2)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .frame(width: 100, height: 40)
                    
                    HStack {
                        Text(myLikes == 1 ? "1 like" : "\(myLikes) likes")
                            .font(.subheadline)
                            .foregroundColor(.brown)
                        
                        Button {
                            isLike.toggle()
                            if isLike == true {
                                myLikes += 1
                            } else {
                                myLikes -= 1
                            }
                        } label: {
                            Image(systemName: isLike ? "heart.fill" : "heart")
                                .foregroundColor(.brown)
                        }
                    }
                }
            }
            .frame(width: 390, height: 120)
        }
    }
}

struct DishView_Previews: PreviewProvider {
    static var previews: some View {
        DishView()
    }
}
