//
//  ButtonsMainScreen.swift
//  Birmingham
//
//  Created by Aleksey Nosik on 23.02.2023.
//

import SwiftUI
import MapKit


struct ButtonsMainScreen: View {
    var text: String
    var view: String?
    var width: CGFloat?
    var height: CGFloat?
    var radius: CGFloat?
    var fontSize: CGFloat?
        
    let coordinate = CLLocationCoordinate2D(latitude: 50.418_66, longitude: 30.489_23)
    
    var body: some View {
        NavigationLink {
            switch view {
            case "MyHistoryView": MyHistoryView()
            case "ReservationView": ReservationView()
            case "TakeAwayView": TakeAwayView()
            case "TableInRestaurant": TableInRestaurant()
            case "Contacts": ContactView(coordinate: coordinate)
            default: ContentView()
            }
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: radius ?? 25)
                    .fill(.brown).brightness(-0.3)
                    .frame(width: (width ?? 150), height: (height ?? 150))
                    .shadow(radius: 3)
                
                VStack(alignment: .leading) {
                    Text(text)
                        .font(.custom("Text", size: fontSize ?? 25))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                }
                .frame(width: width, height: height)
                .lineLimit(nil)
                .frame(width: width ?? 100, height: height)
            }
        }
    }
}

struct ButtonsMainScreen_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsMainScreen(text: "Test", view: "Con", width: 150, height: 150)
    }
}
