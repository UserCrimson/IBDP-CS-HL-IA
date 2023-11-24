
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
    @State private var Username = ""
    @State private var Password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showingLogInScreen = false
    
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
                    Text("Login")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    TextField("Username", text: $Username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.white.opacity(0.75))
                        .cornerRadius(10)
                        .border(.red,width: CGFloat (wrongUsername))
                    
                    SecureField("Password", text: $Password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.white.opacity(0.75))
                        .cornerRadius(10)
                        .border(.red,width: CGFloat (wrongPassword))
                    
                    Button("Login"){
                        authenticateUser(Username: Username, Password: Password)
                        
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    
                    
                    
                    // Current Work - RC 06 19
                    NavigationLink{
                        Signup()
                    }label:{
                        HStack(spacing: 3){
                            Text("Dont have an account")
                            Text("Sign up")
                                .fontWeight(.bold)
                        }
                        .font(.system(size: 20))
                    }
            
            

                    // Temp
                    NavigationLink(destination: Text("you have been logged in @\(Username)"), isActive: $showingLogInScreen) {
                        EmptyView()
                    // Temp will be changed to a different page which will be the homepage after it has been developed
                    
                        
                        
                        // need to use a stackview for the sign up page then create a local database for the username and password - todo
            
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
        
        func authenticateUser(Username: String, Password: String ){
            if Username.lowercased() == "tester" {
                wrongUsername = 0
                if Password.lowercased() == "pass"{
                    wrongPassword = 0
                    showingLogInScreen = true
        
                } else {
                    wrongPassword = 2
                }
                    
            }else {
                wrongUsername = 2
                    
                
                
            }
        }
    }


  
    
    
    
    
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            Login()
        }
    }

    







