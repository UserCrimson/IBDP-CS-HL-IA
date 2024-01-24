
//
//  Signup.swift
//  IA
//
//  Created by CHRISTIE, Russell on 24.11.23.
//

import SwiftUI

struct Signup: View {
  
        @State var Fullname = ""
        @State var Password = ""
        @State var confirmpassword = ""
        @State var Email = ""
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
                   
                
                
                TextField("Fullname", text: $Fullname)
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
                
                
                ZStack(alignment: .trailing){
                    SecureField("Confirm Password", text: $confirmpassword)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.white.opacity(0.75))
                        .cornerRadius(10)
                        .border(.gray, width: 1.75)
                    
                    if !Password.isEmpty && !confirmpassword.isEmpty{
                        if Password == confirmpassword{
                            Image(systemName: "checkmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundColor(Color(.systemGreen))
                        }else {
                            Image(systemName: "xmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundColor(Color(.systemRed))
                        }
                    }
                       
                }
                   
                
                   
                

                Button{
                    Task{
                        try await viewModel.createUser(withEmail: Email,
                                                       password: Password,
                                                       fullname: Fullname)
                    }
                    
                }label: {
                    HStack{
                        Text("SIGN UP")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)

                }
                .background(Color(.systemBlue))
                .opacity(formIsValid ? 1.0 : 0.5  )
                .cornerRadius(10)
                .padding(.top, 24)
                
                Spacer()
                
                Button{
                    dismiss()
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


extension Signup: AuthenticationFormProtocol{
    var formIsValid: Bool {
        return !Email.isEmpty
        && Email.contains("@")
        && !Password.isEmpty
        && Password.count > 5
        && confirmpassword == Password
        && !Fullname.isEmpty
        
        // Setting rules that the text fields must follow such as the email must contain the @ symbol and the password cannot be empty and must be greater than 5 characters
    }
}
    
    struct Signup_Previews: PreviewProvider {
        static var previews: some View {
            Signup()
        }
    }

