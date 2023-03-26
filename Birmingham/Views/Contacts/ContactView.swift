//
//  ContactView.swift
//  Birmingham
//
//  Created by Aleksey Nosik on 23.02.2023.
//

import SwiftUI
import MapKit

struct Details: View {
    @Environment(\.openURL) var openURL

    let text: String
    let link: String
    let image: Image
    
    var body: some View {
        Section {
        } header: {
            HStack {
                Text(text)
                Spacer()
                
                Button {
                    openURL(URL(string: link)!)
                } label: {
                    image
                        .resizable()
                        .frame(width: 30, height: 30)
                        .cornerRadius(5)
                }
            }
        }
    }
}

struct ContactView: View {
    @State private var region = MKCoordinateRegion()
    var coordinate: CLLocationCoordinate2D

    let contacts = Contacts(adress: "Kyiv, maidan Nezalezhnosti, 12",
                            schedule: "10:00 - 23:00",
                            phoneNumber: "+38 073 123 4567",
                            email: "birminghham@gmail.com",
                            site: "https://goodtime.kh.ua/",
                            instagram: "https://www.instagram.com/alekseynosik/?hl=ru",
                            pinterest: "https://www.pinterest.com/",
                            facebook: "https://www.facebook.com/aleksey.nosik/")
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.1)
                .ignoresSafeArea()
            
            VStack {
                Map(coordinateRegion: $region)
                    .onAppear() {
                        setRegion(coordinate)
                    }
                    .frame(width: 400, height: 400)
                
                Spacer()
                
                Divider()
                Form {
                    Details(text: "Adress\n\(contacts.adress)", link: contacts.instagram, image: Image("instagram"))
                    Details(text: "Open/Closed\n\(contacts.schedule)", link: contacts.pinterest, image: Image("pinterest"))
                    Details(text: "Phone number\n\(contacts.phoneNumber)", link: contacts.facebook, image: Image("facebook"))
                    Details(text: "Email\n\(contacts.email)", link: contacts.email, image: Image(systemName: "phone.circle.fill"))
                }
                .font(.subheadline)
                .foregroundColor(.myBrown)
            }
        }
    }
    
    private func setRegion(_ coordinates: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.08, longitudeDelta: 0.08)
        )
    }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView(coordinate: CLLocationCoordinate2D(latitude: 50.418_66, longitude: 30.489_23))
    }
}
