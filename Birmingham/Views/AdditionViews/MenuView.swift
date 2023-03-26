//
//  MenuView.swift
//  Birmingham
//
//  Created by Aleksey Nosik on 28.02.2023.
//

import SwiftUI

struct MenuView: View {
    @ObservedObject var order: Order
    @StateObject private var menu = Menu()

    var body: some View {
        NavigationView {
            ScrollView {
                Group {
                    Text("Salads")
                        .font(.title).bold()
                    
                    ForEach(menu.salads) { salad in
                        DishCell(order: order, dish: salad)
                    }
                }
                
                Group {
                    Text("FirstDishes")
                        .font(.title).bold()
                    
                    ForEach(menu.firstDishes) { firstDish in
                        DishCell(order: order, dish: firstDish)
                    }
                }
                
                Group {
                    Text("SecondDishes")
                        .font(.title).bold()
                    
                    ForEach(menu.secondDishes) { secondDish in
                        DishCell(order: order, dish: secondDish)
                    }
                }
                
                Group {
                    Text("Drinks")
                        .font(.title).bold()
                    
                    ForEach(menu.drinks) { drink in
                        DishCell(order: order, dish: drink)
                    }
                }
                
                Group {
                    Text("Desserts")
                        .font(.title).bold()
                    
                    ForEach(menu.desserts) { dessert in
                        DishCell(order: order, dish: dessert)
                    }
                }
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(order: Order())
    }
}
