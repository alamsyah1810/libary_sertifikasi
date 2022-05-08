//
//  HomePage.swift
//  Library System
//
//  Created by Alamsyah Oktavian on 07/05/22.
//

import SwiftUI

struct HomePage: View {
    
    @Environment(\.presentationMode) var presentationMode

    
    var body: some View {
            ZStack(alignment: .top) {
                ScrollView() {
                    HStack() {
                        VStack {}
                            .frame(width: 83, height: 83)
                            .background(Color.white)
                            .cornerRadius(10)
                    
                    
                        VStack(alignment: .leading) {
                            Text("Judul buku")
                                .foregroundColor(Color.white)
                                .fontWeight(.bold)
                                .font(.headline)
                    
                            Text("Deskripsi buku")
                                .fontWeight(.regular)
                                .foregroundColor(Color.white)
                                .font(.footnote)
                                .multilineTextAlignment(.leading)
                                .lineLimit(2)
                            
                            NavigationLink(destination: DetailBuku()) {
                                     Text("More")
                                 }
                            .foregroundColor(Color.white)
                            .padding(.top, 5)
                    
                        }
                        
                       
                        
                    }
                    .padding(.leading, 20)
                    .frame(width: 320, height: 117, alignment: .leading)
                    .background(Color.black)
                    .cornerRadius(10)
                    .padding(.top, 20)
                
                    
                    
                }
                .navigationBarTitle("Book List", displayMode: .inline)
                .navigationBarItems(
                    leading: Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                    }),
                    trailing: Button(action: {
                        
                    }, label: {
                        NavigationLink(destination: TambahBuku()) {
                                 Text("Add")
                             }
                    })
                )
            }
        }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
