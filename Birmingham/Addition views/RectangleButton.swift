//
//  RectangleButton.swift
//  Birmingham
//
//  Created by Aleksey Nosik on 16.12.2022.
//

import SwiftUI
import MapKit

struct RectangleButton: View {
    var text: String
    var subtext: String?
    var view: String
    
    let coordinate = CLLocationCoordinate2D(latitude: 50.418_66, longitude: 30.489_23)
    
    var body: some View {
        NavigationLink {
            switch view {
            case "TableReservView": TableReservView()
            case "TakeAwayView": TakeAwayView()
            case "QR": TakeAwayView()
            case "Contacts": ContactsView(coordinate: coordinate)
            default: Main()
            }
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .fill(.brown).brightness(-0.3)
                    .frame(width: 155, height: 155)
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(.brown).brightness(-0.1)
                    .frame(width: 150, height: 150)
                    
                
                
                VStack(alignment: .leading) {
                    Text(text)
                        .font(.custom("Text", size: 25))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                    
                    if let text = subtext {
                        Text(text)
                            .font(.subheadline)
                            .foregroundColor(.white)
                    }
                }
                .frame(width: 150, height: 150)
                .lineLimit(nil)
            }
        }
    }
}

struct RectangleButton_Previews: PreviewProvider {
    static var previews: some View {
        RectangleButton(text: "Test", subtext: "This is test text", view: "TableReservView")
    }
}
