//
//  ContactsView.swift
//  Birmingham
//
//  Created by Aleksey Nosik on 18.12.2022.
//

import SwiftUI
import MapKit

struct ContactsView: View {
    
    let contacts = Contacts(adress: "Kyiv, maidan Nezalezhnosti, 12", schedule: "10:00 - 23:00", phoneNumber: "+38 073 123 4567", email: "birminghham@gmail.com")
    
    var coordinate: CLLocationCoordinate2D
    @State private var region = MKCoordinateRegion()
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $region)
                .onAppear() {
                    setRegion(coordinate)
                    
                }
                .frame(width: .infinity, height: 400)
            
            Spacer()
            
            Divider()
            Form {
                Section {
                } header: {
                    HStack {
                        Text("Adress\n\(contacts.adress)")
                        Spacer()
                        
                        Button {
                            // site
                        } label: {
                            Image("instagram")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .cornerRadius(5)
                        }
                    }
                }
                
                Section {
                } header: {
                    HStack {
                        Text("Open/Closed\n\(contacts.schedule)")
                        Spacer()
                        
                        Button {
                            // site
                        } label: {
                            Image("facebook")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .cornerRadius(5)
                        }
                    }
                }
                
                Section {
                } header: {
                    HStack {
                        Text("Phone number\n\(contacts.phoneNumber)")
                        Spacer()
                        
                        Button {
                            // site 
                        } label: {
                            Image("pinterest")
                                .resizable()
                                .frame(width: 35, height: 35)
                                .cornerRadius(5)
                        }
                    }
                }
                
                Section {
                } header: {
                    HStack {
                        Text("Email\n\(contacts.email)")
                        Spacer()
                        Button {
                            //calling
                        } label: {
                            Image(systemName: "phone.circle.fill")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.green)
                        }
                    }
                }
            }
            .font(.subheadline)
            .foregroundColor(.brown)
        }
    }
    
    
    private func setRegion(_ coordinates: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
    }
}

struct ContactsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsView(coordinate: CLLocationCoordinate2D(latitude: 50.418_66, longitude: 30.489_23))
    }
}
