
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
        @State private var confirmpassword = ""
        @State private var emailAddress = ""
        @State private var wrongUsername = 0
        @State private var wrongPassword = 0
        @State private var confirmPassword = 0
        @State private var confirmEmail = 0
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
            
                Text("Register")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                TextField("Email Address", text: $emailAddress)
                    .padding()
                    .frame(width: 300, height: 50)
                    .frame(width: 300, height: 50)
                    .background(Color.white.opacity(0.75))
                    .cornerRadius(10)
                    .border(.black, width: 1.75)
                    .border(.red,width: CGFloat (confirmEmail))
                
                
                TextField("Username", text: $Username)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.white.opacity(0.75))
                    .cornerRadius(10)
                    .border(.black, width: 1.75)
                    .border(.red,width: CGFloat (wrongUsername))
                
                SecureField("Password", text: $Password)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.white.opacity(0.75))
                    .cornerRadius(10)
                    .border(.black,width: 1.75)
                    .border(.red,width: CGFloat (wrongPassword))
                
                SecureField("Confirm Password", text: $confirmpassword)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.white.opacity(0.75))
                    .cornerRadius(10)
                    .border(.black, width: 1.75)
                    .border(.red,width: CGFloat (confirmPassword))
                

                Button("Register"){
                    
                }
                .foregroundColor(.white)
                .frame(width: 300, height: 50)
                .background(Color.blue)
                .cornerRadius(10)
                
                NavigationLink{
                    Login()
                }label:{
                    HStack(spacing: 3){
                        Text("Already have an Account")
                        Text("Sign in")
                            .bold()
                    }
                    .font(.system(size: 20))
                }
                
            }
        }
    }
}













struct Signup_Previews: PreviewProvider {
    static var previews: some View {
        Signup()
    }
}
