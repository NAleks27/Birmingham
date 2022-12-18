//
//  GoToOrderView.swift
//  Birmingham
//
//  Created by Aleksey Nosik on 18.12.2022.
//

import SwiftUI

let dish1 = Dish(name: "Salad1", image: "salad1", description: "Tasty salad. Tasty salad. Tasty salad. Tasty salad. Tasty salad. Tasty salad. Tasty salad. Tasty salad.", price: 150)
let dish2 = Dish(name: "Salad2", image: "salad2", description: "Tasty salad. Tasty salad. Tasty salad. Tasty salad. Tasty salad. Tasty salad. Tasty salad. Tasty salad.", price: 110)
let dish3 = Dish(name: "Salad3", image: "salad3", description: "Tasty salad. Tasty salad. Tasty salad. Tasty salad. Tasty salad. Tasty salad. Tasty salad. Tasty salad.", price: 100)

struct GoToOrderView: View {
    @State private var isPresentAlert = false
    @Environment(\.dismiss) var dismiss

    var basketOrder: [Dish] = [dish1, dish2, dish3]
    
    var sum: Int {
        var sum = 0
        for dish in basketOrder {
            sum += dish.price
        }
        return sum
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    ForEach(basketOrder, id: \.self) { dish in
                        DishView(dishh: dish)
                    }
//                    DishView()
//                    DishView()
//                    DishView()
                }
                .navigationTitle("ORDER")
                .navigationBarTitleDisplayMode(.inline)
                
                Section {
                    HStack {
                        Text("Check sum:")
                        Spacer()
                        Text("\(sum) uah")
                    }
                    .foregroundColor(.black)
                    .padding()
                }
                
                Button {
                    isPresentAlert.toggle()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 50)
                            .fill(.brown)
                            .frame(width: 300, height: 60)
                        
                        HStack(alignment: .center) {
                            Text("Confirm order")
                                .font(.title3)
                                .foregroundColor(.white)
                            
                            ZStack {
                                Image(systemName: "basket.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                
                                Image(systemName: "\(basketOrder.count).circle.fill")
                                    .resizable()
                                    .frame(width: 20, height: 20, alignment: .bottomTrailing)
                                    .foregroundColor(.black)
                            }
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                        }
                    }
                }
                .alert("Thank you for your order!", isPresented: $isPresentAlert) {
                    Button("OK", role: .cancel, action: cancel)
                }
            }
        }
    }
    
    func cancel() {
        dismiss()
    }
}

struct GoToOrderView_Previews: PreviewProvider {
    static var previews: some View {
        GoToOrderView()
    }
}
