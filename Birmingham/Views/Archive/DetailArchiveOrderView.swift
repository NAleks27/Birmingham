//
//  DetailArchiveOrderView.swift
//  Birmingham
//
//  Created by Aleksey Nosik on 18.03.2023.
//

import SwiftUI

struct DetailArchiveOrderView: View {
    var order: Order
    
    var body: some View {
        VStack {
            InfoOrderView(table: order)
        }
    }
}

struct DetailArchiveOrderView_Previews: PreviewProvider {
    static var previews: some View {
        DetailArchiveOrderView(order: Order())
    }
}
