//
//  Dish.swift
//  Birmingham
//
//  Created by Aleksey Nosik on 17.12.2022.
//

import Foundation

struct Dish: Hashable {
    let name: String
    let image: String
    let description: String
    var price: Int
    var likes = 0
}
