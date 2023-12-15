//
//  SettingRowView.swift
//  IA
//
//  Created by CHRISTIE, Russell on 15.12.23.
//

import SwiftUI

struct SettingRowView: View {
    let imagename: String
    let title:String
    let tintColor: Color
    
    // This is to save time, so instead of writing the same code i will just call this
    
    var body: some View {
        HStack(spacing: 14) {
            Image(systemName: imagename)
                .imageScale(.small)
                .font(.title)
                .foregroundColor(tintColor)
            
            Text(title)
                .font(.subheadline)
                .foregroundColor(.black)
            
        }
        
    }
}

struct SettingRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingRowView(imagename: "gear", title: "Version", tintColor: Color(.systemGray))
    }
}
