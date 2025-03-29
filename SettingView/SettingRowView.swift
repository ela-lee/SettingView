//
//  SettingRowView.swift
//  SettingView
//
//  Created by Ella's Mac on 3/29/25.
//

import SwiftUI


struct SettingRowView: View {
    var icon: String
    var title: String
    var statue: String?
    var backgroundColor: Color
    
    
    var body: some View {
        
        HStack {
            Image(systemName: icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 17, height: 17)
                .padding(5)
                .foregroundStyle(.white)
                .background(backgroundColor)
                .clipShape(RoundedRectangle(cornerRadius: 5))
            
            Text(title)
            
            Spacer()
            
            Text(statue ?? "")
                .foregroundStyle(.gray)
        }
    }
}

#Preview {
    SettingRowView(icon:"wifi", title: "Wi-Fi", statue: "On", backgroundColor: .blue)
}
