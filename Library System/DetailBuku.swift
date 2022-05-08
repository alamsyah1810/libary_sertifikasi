//
//  DetailBuku.swift
//  Library System
//
//  Created by Alamsyah Oktavian on 08/05/22.
//

import SwiftUI

struct DetailBuku: View {
    
    @State var desDetail: String = "Book Description"
    @State var judulDetail: String = ""
    @State var productImage: Data? = nil
    @State private var image: Image?
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State var disable: Bool = true
    @State var selectedDate = Date()
    
    var body: some View {
        VStack {
            
            TextField("Book Title", text: $judulDetail)
                .font(.callout)
                .frame(width: 290, height: 30)
                .padding(10)
                .background(Color.white)
                .foregroundColor(Color.black)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth:1))
                .cornerRadius(10)
                .disabled(disable)

            
            TextEditor(text: $desDetail)
                .font(.callout)
                .frame(width: 290, height: 90, alignment: .topLeading)
                .padding(10)
                .background(Color.white)
                .foregroundColor(Color.gray)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth:1))
                .cornerRadius(10)
                .disabled(disable)
            
            DatePicker("", selection: $selectedDate, displayedComponents: .date)
                .padding(.trailing, 250)
                .frame(width: 310, height: 50, alignment: .leading)
            
            StandardSquareImagePicker(
                title: "",
                image: $productImage
            )
            .frame(width: 340, height: 150, alignment: .leading)
            .disabled(disable)

            Button("Edit Detail", action: {
                self.disable.toggle()
            })
            .frame(width: 310,height: 50)
            .font(.headline)
            .foregroundColor(Color.white)
            .background(Color.black)
            .cornerRadius(10)
            .font(.body)
            .padding(.top, 20)

               
        }
        .navigationBarTitle("Book Detail", displayMode: .inline)
        .padding(.bottom, 240)
    }
}

struct DetailBuku_Previews: PreviewProvider {
    static var previews: some View {
        DetailBuku()
    }
}
