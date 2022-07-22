//
//  CreateProfileTextfieldStyle.swift
//  Chat
//
//  Created by Tony Dinh on 7/21/22.
//

import Foundation
import SwiftUI

struct CreateProfileTextfieldStyle: TextFieldStyle {
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        
        ZStack {
            Rectangle()
                .foregroundColor(Color("input"))
                .cornerRadius(8)
                .frame(height: 46)
            
            // This references the TextField
            configuration
                .font(Font.tabBar)
                .padding()
        }
        
    }
    
}
