//
//  Dush.swift
//  Birmingham
//
//  Created by Aleksey Nosik on 23.02.2023.
//

import Foundation

class Dish: Identifiable, ObservableObject, Hashable {
    @Published var id = UUID()
    @Published var name: String
    @Published var category: Categories
    @Published var composition: String
    @Published var price: Int
    @Published var image: String
    @Published var amount = 0
    
    enum Categories: String {
        case Salads = "Salads"
        case FirstDishes = "FirstDishes"
        case SecondDishes = "SecondDishes"
        case Drinks = "Drinks"
        case Desserts = "Desserts"
    }
    
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Dish, rhs: Dish) -> Bool {
        return true
    }
    
    init(name: String, category: Categories, composition: String, price: Int, image: String, amount: Int) {
        self.name = name
        self.category = category
        self.composition = composition
        self.price = price
        self.image = image
        self.amount = amount
    }
    
    
    
    static public var sampleDish = Dish(name: "Salad", category: .Salads, composition: "Salad, Salad, Salad, Salad,Salad SaladSaladSaladSaladSaladSaladSaladSaladSaladSaladSaladSaladSaladSaladSalad", price: 0, image: "salad1", amount: 0)
}
