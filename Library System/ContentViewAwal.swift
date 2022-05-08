//
//  ContentViewAwal.swift
//  Library System
//
//  Created by Alamsyah Oktavian on 08/05/22.
//

import SwiftUI
import Firebase
import GoogleSignIn

struct ContentViewAwal: View {
    @AppStorage("log_Status") var log_Status = false

    var body: some View {
        if log_Status {
            NavigationView {
                VStack(spacing: 15) {
                    
                    Button(action: {
                                }, label: {
                                    NavigationLink(destination: HomePage()) {
                                             Text("Continue")
                                         }
                                })
                                .frame(width: 310,height: 50)
                                .font(.headline)
                                .foregroundColor(Color.white)
                                .background(Color.black)
                                .cornerRadius(10)
                                .font(.body)
                                .padding(.top, 20)
                                    
                    Button("Logout") {
                        
                        GIDSignIn.sharedInstance.signOut()
                        try? Auth.auth().signOut()
                        
                        withAnimation{
                            log_Status = false
                        }
                    }
                    .frame(width: 310,height: 50)
                    .font(.headline)
                    .foregroundColor(Color.white)
                    .background(Color.black)
                    .cornerRadius(10)
                    .font(.body)
                }
                .padding(.bottom, 100)
            }
        } else {
            ContentView()
        }
    }
}

struct ContentViewAwal_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewAwal()
    }
}
