//
//  Extensions.swift
//  Birmingham
//
//  Created by Aleksey Nosik on 04.03.2023.
//

import Foundation
import SwiftUI

extension Color {
    static var myBrown: Color {
        Color("MyBrown")
    }
}

extension ShapeStyle where Self == Color {
    static var myBrownColor: Color {
        Color("MyBrown")
    }
}


