//
//  Order.swift
//  Birmingham
//
//  Created by Aleksey Nosik on 26.02.2023.
//

import Foundation

class Order: Identifiable, ObservableObject {
    @Published var id = UUID()
    @Published var name = OrderName.Table
    @Published var number = Int.random(in: 1...100)
    @Published var dishes = [Dish]()
    @Published var sum = 0
    @Published var date = Date.now.formatted(date: .abbreviated, time: .shortened)
    @Published var status = StatusOrdersAndTables.Open
    
    enum StatusOrdersAndTables: String {
        case Open = "Open"
        case Update = "Update"
        case Closed = "Closed"
    }
    
    enum OrderName: String {
        case Table = "Table"
        case Order = "Order"
    }
}




