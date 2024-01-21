
//
//  SwiftUIView.swift
//  IA
//
//  Created by CHRISTIE, Russell on 21.11.23.
//
//
//
//
//  ContentView.swift
//  IA Project
//
//  Created by CHRISTIE, Russell on 17.05.23.
//

import SwiftUI
struct Login: View {
    // Declaring Variable names for future use
    @State private var Email = ""
    @State private var Password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View{
        NavigationView{
            
            
            // Creating the inital design that you can see in the background
            ZStack{
                Color
                    .white.opacity(0.10)
                    .ignoresSafeArea()
                
                Circle()
                    .scale(1.7)
                    .foregroundColor(.blue.opacity(0.25))
                Circle()
                    .scale(1.3)
                    .foregroundColor(.blue.opacity(0.15))
                
                // Creating the buttons and text fields that are going to be used an an input and buttons for login and sign up
                VStack{
                    Spacer()
                    
                    Text("Login")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    

                    TextField("Email", text: $Email)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.white.opacity(0.75))
                        .cornerRadius(10)
                    SecureField("Password", text: $Password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.white.opacity(0.75))
                        .cornerRadius(10)
                      
                    
                    Button{
                        Task {
                            try await viewModel.signIn(withEmail: Email, password: Password)
                        }
                    }label:{
                        HStack(spacing: 3){
                            Text("Log In")
                                .fontWeight(.semibold)
                            Image(systemName: "arrow.right")
                        }
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                    }
                    .background(Color(.systemBlue))
                    .cornerRadius(10)
                    .padding(.top, 24)
                    
                    Spacer()
                        
                        // Current Work - RC 06 19
                    
                    NavigationLink{
                        Signup()
                            .navigationBarBackButtonHidden(true)
                    }label:{
                        HStack(spacing: 3){
                            Text("Dont have an ccount?")
                            Text("Sign up")
                                .fontWeight(.semibold)
                        }
                        .font(.system(size: 14))
                    }
                        
                        
                            
        
                            
                            
                            
                        }
                    }
                }
                .navigationBarHidden(true)
            }
        }





    struct Login_Previews: PreviewProvider {
        static var previews: some View {
            Login()
        }
    }

    







