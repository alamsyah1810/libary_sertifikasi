//
//  StandardSquareImagePicker.swift
//  Library System
//
//  Created by Alamsyah Oktavian on 08/05/22.
//

import SwiftUI

struct StandardSquareImagePicker: View {
    var title: String
    
    @Binding var image: Data?
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    
    var body: some View {
        
        VStack {
            
            VStack {
                ZStack{
                    RoundedRectangle(cornerRadius: 2)
                        .fill(Color.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(Color(UIColor.white))
                        .frame(width: 150, height: 150, alignment: .leading)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth:1))
                        .cornerRadius(10)
                        .padding(.horizontal, 15)
                        .padding(.vertical, 5)
                        .aspectRatio(contentMode: .fill)
                    if image != nil{
                        Image(uiImage: UIImage(data: self.image!)!)
                            .resizable()
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .frame(width: 150, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .scaledToFit()
                        
                    } else{
                        Text("Select Image")
                    }
                }
                .onTapGesture {
                    self.showingImagePicker = true
                }
            }
        }
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
            ImagePicker(image: self.$inputImage)
                .preferredColorScheme(.light)
        }
        
    }
    
    private  func loadImage() {
        guard let inputImage = inputImage else {return}
        image = inputImage.compressedJPEG(.lowest)
    }
}

struct StandardSquareImagePicker_Previews: PreviewProvider {
    static var previews: some View {
        StandardSquareImagePicker(title: "Product Image", image: .constant(nil))
    }
}
