//
//  Menu.swift
//  Birmingham
//
//  Created by Aleksey Nosik on 28.02.2023.
//

import Foundation

// для добавления в заказ
class Menu: ObservableObject {
    @Published var salads = [Dish(name: "Salad1",
                                  category: .Salads,
                                  composition: "Boiled chicken fillet, boiled beef, potatoes, pickles, boiled eggs, peas, mayonnaise",
                                  price: 135,
                                  image: "salad1",
                                  amount: 0),
                             
                             Dish(name: "Salad2",
                                  category: .Salads,
                                  composition: "Boiled chicken fillet, boiled beef, potatoes, pickles, boiled eggs, peas, mayonnaise",
                                  price: 180,
                                  image: "salad2",
                                  amount: 0),
                             
                             Dish(name: "Salad3",
                                  category: .Salads,
                                  composition: "Boiled chicken fillet, boiled beef, potatoes, pickles, boiled eggs, peas, mayonnaise",
                                  price: 150,
                                  image: "salad3",
                                  amount: 0),
                             
                             Dish(name: "Salad4",
                                  category: .Salads,
                                  composition: "Boiled chicken fillet, boiled beef, potatoes, pickles, boiled eggs, peas, mayonnaise",
                                  price: 145,
                                  image: "salad4",
                                  amount: 0),
    ]
    
    @Published var firstDishes = [Dish(name: "FirstDish1",
                            category: .FirstDishes,
                            composition: "Something1",
                            price: 150,
                            image: "firstDish1",
                            amount: 0),
                       
                       Dish(name: "FirstDish2",
                            category: .FirstDishes,
                            composition: "Something2",
                            price: 100,
                            image: "firstDish2",
                            amount: 0),
                       
                       Dish(name: "FirstDish3",
                            category: .FirstDishes,
                            composition: "Something3",
                            price: 190,
                            image: "firstDish3",
                            amount: 0),
                       
                       Dish(name: "FirstDish4",
                            category: .FirstDishes,
                            composition: "Something4",
                            price: 110,
                            image: "firstDish4",
                            amount: 0),
                       ]
    
    @Published var secondDishes = [Dish(name: "SecondDish1",
                             category: .SecondDishes,
                             composition: "Something1",
                             price: 245,
                             image: "secondDish1",
                             amount: 0),
                        
                        Dish(name: "SecondDish2",
                             category: .SecondDishes,
                             composition: "Something2",
                             price: 190,
                             image: "secondDish2",
                             amount: 0),
                        
                        Dish(name: "SecondDish3",
                             category: .SecondDishes,
                             composition: "Something3",
                             price: 200,
                             image: "secondDish3",
                             amount: 0),
                        
                        Dish(name: "SecondDish4",
                             category: .SecondDishes,
                             composition: "Something4",
                             price: 210,
                             image: "secondDish4",
                             amount: 0),
    ]
    
    @Published var drinks = [Dish(name: "Drink1",
                       category: .Drinks,
                       composition: "Something1",
                       price: 50,
                       image: "drink1",
                       amount: 0),
                  
                  Dish(name: "Drink2",
                       category: .Drinks,
                       composition: "Something2",
                       price: 35,
                       image: "drink2",
                       amount: 0),
                  
                  Dish(name: "Drink3",
                       category: .Drinks,
                       composition: "Something3",
                       price: 55,
                       image: "drink3",
                       amount: 0),
                  
                  Dish(name: "Drink4",
                       category: .Drinks,
                       composition: "Something4",
                       price: 40,
                       image: "drink4",
                       amount: 0),
    ]
    
    @Published var desserts = [Dish(name: "Dessert1",
                       category: .Drinks,
                       composition: "Something1",
                       price: 150,
                         image: "dessert1",
                         amount: 0),
                  
                  Dish(name: "Dessert2",
                       category: .Drinks,
                       composition: "Something2",
                       price: 135,
                       image: "dessert2",
                       amount: 0),
                  
                  Dish(name: "Dessert3",
                       category: .Drinks,
                       composition: "Something3",
                       price: 155,
                       image: "dessert3",
                       amount: 0),
                  
                  Dish(name: "Dessert4",
                       category: .Drinks,
                       composition: "Something4",
                       price: 140,
                       image: "dessert4",
                       amount: 0),
    ]    
}

