
//
//  SwiftUIView.swift
//  IA
//
//  Created by CHRISTIE, Russell on 21.11.23.
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
                    // Secure field allows for privacy whiel typing the passwords
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.white.opacity(0.75))
                        .cornerRadius(10)
                      
                    
                    // Sign in Button
                    
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
                    .opacity(formIsValid ? 1.0: 0.5  )
                    .cornerRadius(10)
                    .padding(.top, 24)
                    
                    Spacer()
                        
                        
                    // Register Page
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
 
extension Login: AuthenticationFormProtocol{
    var formIsValid: Bool {
        return !Email.isEmpty
        && Email.contains("@")
        && !Password.isEmpty
        && Password.count > 5
        
        // Setting rules that the text fields must follow such as the email must contain the @ symbol and the password cannot be empty and must be greater than 5 characters
    }
    
    
}



    struct Login_Previews: PreviewProvider {
        static var previews: some View {
            Login()
        }
    }

    







