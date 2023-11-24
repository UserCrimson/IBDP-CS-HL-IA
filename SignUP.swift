//
//  Signup.swift
//  IA
//
//  Created by CHRISTIE, Russell on 24.11.23.
//

import SwiftUI

struct Signup: View {
  
        @State private var Username = ""
        @State private var Password = ""
        @State private var wrongUsername = 0
        @State private var wrongPassword = 0
        @State private var showingLogInScreen = false
        
        var body: some View {
        
        ZStack{
            Color
                .blue.opacity(0.25)
                .ignoresSafeArea()
            Circle()
                .scale(1.7)
                .foregroundColor(.blue.opacity(0.15))
            Circle()
                .scale(1.3)
                .foregroundColor(.white)
            
            
            
            VStack{
            
                Image("Icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 120)
                    .padding(.vertical,1)
                
                Text("SignUp")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                TextField("Username", text: $Username)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.white.opacity(0.75))
                    .cornerRadius(10)
                    .border(.black, width: 2)
                    .border(.red,width: CGFloat (wrongUsername))
                
                SecureField("Password", text: $Password)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.white.opacity(0.75))
                    .cornerRadius(10)
                    .border(.black,width: 2)
                    .border(.red,width: CGFloat (wrongPassword))
                
            }
        }
    }
}













struct Signup_Previews: PreviewProvider {
    static var previews: some View {
        Signup()
    }
}
