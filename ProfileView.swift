//
//  Profile View.swift
//  IA
//
//  Created by CHRISTIE, Russell on 15.12.23.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        if let user = viewModel.currentUser{
            List{
                // User info View
                Section{
                    HStack{
                        Text(user.initails)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 72, height: 72)
                            .background(Color(.systemGray3))
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading, spacing: 4){
                            Text(user.fullname)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.top, 4)
                            
                            Text(user.email)
                                .font(.footnote)
                                .foregroundColor(.gray)
                            
                        }
                        
                    }
                    
                }
                
                Section("General"){
                    HStack{
                        SettingRowView(
                            imagename: "gear",
                            title: "Version",
                            tintColor: Color(.systemGray))
                        
                        Spacer()
                        
                        Text("1.0.0")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                         
                    }
                }
                
                Section("Account") {
                    Button{
                        viewModel.signOut()
                    } label:{
                        SettingRowView(imagename: "arrow.left.circle.fill", title: "Sign Out", tintColor: .red)
                    }
                    
                    
                    Button{
                        print("Delete Account")
                    } label:{
                        SettingRowView(imagename: "xmark.circle.fill", title: "Delete Account", tintColor: .red)
                    }
                    
                    
                    
                    
                    
                    
                }
            }
        }
    }

        }
       
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
