//
//  ContentView.swift
//  Library System
//
//  Created by Alamsyah Oktavian on 07/05/22.
//

import SwiftUI
import Firebase
import GoogleSignIn

struct ContentView: View {
    @State var userName: String = ""
    @State var passWord: String = ""

    @State var isLoading: Bool = false
    
    @AppStorage("log_Status") var log_Status = false
    
    var body: some View {
//        NavigationView {
//            VStack {
//                HStack {
//                    VStack(alignment: .leading) {
//                        Text("The Librarian")
//                            .font(.largeTitle)
//                            .fontWeight(.bold)
//                            .foregroundColor(Color.black)
//                    }
//                }
//
//                TextField("Username", text: $userName)
//                    .font(.callout)
//                    .frame(width: 290, height: 30)
//                    .padding(10)
//                    .background(Color.white)
//                    .foregroundColor(Color.black)
//                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth:1))
//                    .cornerRadius(10)
//
//                TextField("Password", text: $passWord)
//                    .font(.callout)
//                    .frame(width: 290, height: 30)
//                    .padding(10)
//                    .background(Color.white)
//                    .foregroundColor(Color.black)
//                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth:1))
//                    .cornerRadius(10)
//
//
//            Button(action: {
//            }, label: {
//                NavigationLink(destination: HomePage()) {
//                         Text("Sign In")
//                     }
//            })
//            .frame(width: 310,height: 50)
//            .font(.headline)
//            .foregroundColor(Color.white)
//            .background(Color.black)
//            .cornerRadius(10)
//            .font(.body)
//            .padding(.top, 20)
//            }
//            .padding(.bottom, 100)
//        }
//    }
        
        VStack {
//            Image("Onboard")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(height: getRect().height / 3)
//                .offset(y: -20)
//                .background(
//                Circle()
//                    .fill(Color("LightBlue"))
//                    .scaleEffect(2, anchor: .bottom)
//                    .offset(y: 20)
//                )
            
            VStack(spacing: 20) {
                
//                Text("The best library in town")
//                    .font(.title)
//                    .fontWeight(.light)
//                    .kerning(1.1)
//                    .foregroundColor(Color.gray)
                
                Button {
                    handlerLogin()
                } label: {
                    
                    HStack(spacing: 15) {
                        Image("Google")
                            .resizable()
//                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 38, height: 38)
                        
                        Text("Login with Google")
                            .font(.title3)
                            .fontWeight(.medium)
                            .kerning(1.1)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color.white)
                    .background(Color.black)
                    .cornerRadius(10)
                        
                }
//                .padding(.top, 25)
                
            }
            .padding()
//            .padding(.top, 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .overlay(
            ZStack {
                if isLoading {
                    Color.black
                        .opacity(0.2)
                        .ignoresSafeArea()
                    
                    ProgressView()
                        .font(.title2)
                        .frame(width: 60, height: 60)
                        .background(Color.white)
                        .cornerRadius(10)
                }
            }
        )
    }
    
    func handlerLogin() {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        
        isLoading = true
        
        GIDSignIn.sharedInstance.signIn(with: config, presenting: getRootViewController()) {[self]
            user, err in
            
            if let error = err {
                isLoading = false
                print(error.localizedDescription)
                return
              }

              guard
                let authentication = user?.authentication,
                let idToken = authentication.idToken
              else {
                  isLoading = false
                return
              }

              let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                             accessToken: authentication.accessToken)
            
            Auth.auth().signIn(with: credential) { result, err in
                
                isLoading = false
                
                if let error = err {
                    print(error.localizedDescription)
                    return
                  }
                
                guard let user = result?.user else {
                    return
                }
                
                print(user.displayName ?? "Success!")
                
                withAnimation{
                    log_Status = true
                }
            }
            
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    func getRect()->CGRect {
        return UIScreen.main.bounds
    }
    
    func getRootViewController()->UIViewController {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .init()
        }
        
        guard let root = screen.windows.first?.rootViewController else {
            return .init()
        }
        
        return root
    }
    
}
