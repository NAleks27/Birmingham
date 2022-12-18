//
//  DishView.swift
//  Birmingham
//
//  Created by Aleksey Nosik on 17.12.2022.
//

import SwiftUI

var myLikes = 220

struct DishView: View {
    var dishh: Dish
    
    
    @State private var amountDishes = 0
    @State private var isLike = false
    
    var dish = Dish(
        name: "Caesar",
        image: "salad1",
        description: "Tasty salad. Tasty salad. Tasty salad. Tasty salad. Tasty salad. Tasty salad. Tasty salad. Tasty salad.",
        price: 150)
    
    var body: some View {
        VStack {
            ZStack {
//                Rectangle()
//                    .fill(.brown)
//                    .frame(width: 380, height: 110)
//                    .cornerRadius(10)
//                
//                Rectangle()
//                    .fill(.white)
//                    .frame(width: 376, height: 106)
//                    .cornerRadius(10)
                
                HStack (alignment: .center, spacing: 10) {
                    Image(dishh.image)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                    
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text(dishh.name)
                            .font(.title)
                        
                        
                        Text(dishh.description)
                            .font(.caption)
                            .frame(width: 150, height: 70)
                            .padding(.bottom, 10)
                            
                    }
                    
                    
                    VStack {
                        Text("\(dishh.price) uah")
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
                .frame(width: 380, height: 120)
            }
            Spacer()
        }
    }
}

struct DishView_Previews: PreviewProvider {
    static var previews: some View {
        DishView(dishh: Dish(name: "Caesar", image: "salad1", description: "something", price: 150))
    }
}
