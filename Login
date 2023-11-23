
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
struct ContentView: View {
    @State private var Username = ""
    @State private var Password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showingLogInScreen = false
    
    var body: some View{
        NavigationView{
            
            
            
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
                        
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    
                    NavigationLink(destination: Text("you have been logged in @\(Username)"), isActive: $showingLogInScreen) {
                        EmptyView()
                        
                    }
                }
                .navigationBarHidden(true)
            }
        }
    }
}
  
    
    
    
    
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    







