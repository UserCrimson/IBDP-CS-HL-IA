
//
//  Signup.swift
//  IA
//
//  Created by CHRISTIE, Russell on 24.11.23.
//

import SwiftUI

struct Signup: View {
  
        @State private var Fullname = ""
        @State private var Password = ""
        @State private var confirmpassword = ""
        @State private var Email = ""
        @Environment(\.dismiss) var dismiss
        @EnvironmentObject var viewModel: AuthViewModel
    
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
           
                Spacer()
                
                Text("Register")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                TextField("Email Address", text: $Email)
                    .padding()
                    .frame(width: 300, height: 50)
                    .frame(width: 300, height: 50)
                    .background(Color.white.opacity(0.75))
                    .cornerRadius(10)
                    .border(.gray, width: 1.75)
                   
                
                
                TextField("Username", text: $Fullname)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.white.opacity(0.75))
                    .cornerRadius(10)
                    .border(.gray, width: 1.75)
             
                
                SecureField("Password", text: $Password)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.white.opacity(0.75))
                    .cornerRadius(10)
                    .border(.gray,width: 1.75)
                   
                
                SecureField("Confirm Password", text: $confirmpassword)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.white.opacity(0.75))
                    .cornerRadius(10)
                    .border(.gray, width: 1.75)
                   
                

                Button{
                    Task{
                        try await viewModel.createUser(withEmail: Email,
                                                       password: Password,
                                                       fullname: Fullname)
                    }
                    
                }label: {
                    HStack{
                        Text("Register")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)

                }
                .background(Color.blue)
                .cornerRadius(10)
                .padding(.top, 24)
                
                Spacer()
                
                NavigationLink{
                    Login()
                        .navigationBarBackButtonHidden(true)
                }label:{
                    HStack(spacing: 3){
                        Text("Already have an Account")
                            .foregroundColor(.black)
                        Text("Sign in")
                            .bold()
                            .foregroundColor(.black)
                            
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
