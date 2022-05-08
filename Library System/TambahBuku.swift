//
//  TambahBuku.swift
//  Library System
//
//  Created by Alamsyah Oktavian on 08/05/22.
//

import SwiftUI

struct TambahBuku: View {
    
    @State var desBuku: String = "Book Description"
    @State var judulBuku: String = ""
    @State var productImage: Data? = nil
    @State private var image: Image?
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State var selectedDate = Date()
    
    var body: some View {
        VStack {

            
            TextField("Book Title", text: $judulBuku)
                .font(.callout)
                .frame(width: 290, height: 30)
                .padding(10)
                .background(Color.white)
                .foregroundColor(Color.black)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth:1))
                .cornerRadius(10)
            
            TextEditor(text: $desBuku)
                .font(.callout)
                .frame(width: 290, height: 90, alignment: .topLeading)
                .padding(10)
                .background(Color.white)
                .foregroundColor(Color.black)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth:1))
                .cornerRadius(10)
            
            DatePicker("", selection: $selectedDate, displayedComponents: .date)
                .padding(.trailing, 250)
                .frame(width: 310, height: 50, alignment: .leading)
            
            StandardSquareImagePicker(
                title: "",
                image: $productImage
            )
            .frame(width: 340, height: 150, alignment: .leading)
            
            Button("Add Book", action: {
                print("Book has been added")
            })
            .frame(width: 310,height: 50)
            .font(.headline)
            .foregroundColor(Color.white)
            .background(Color.black)
            .cornerRadius(10)
            .font(.body)
            .padding(.top, 20)
               
        }
        .navigationBarTitle("Add Book", displayMode: .inline)
        .padding(.bottom, 240)
    }
}

struct TambahBuku_Previews: PreviewProvider {
    static var previews: some View {
        TambahBuku()
    }
}
