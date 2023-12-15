//
//  Profile View.swift
//  IA
//
//  Created by CHRISTIE, Russell on 15.12.23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        List{
            // User info View
            Section{
                HStack{
                    Text("RC")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 72, height: 72)
                        .background(Color(.systemGray3))
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading, spacing: 4){
                        Text("Russell Christie")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.top, 4)
                        
                        Text("RussChris@outlook.com")
                            .font(.footnote)
                            .accentColor(.gray)
                        
                    }
                    
            
                }
               
                
            }
            
            Section("General"){
                
            }
            
            Section("Account") {
                
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

