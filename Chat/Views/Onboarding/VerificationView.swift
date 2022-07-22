//
//  VerificationView.swift
//  Chat
//
//  Created by Tony Dinh on 7/21/22.
//

import SwiftUI

struct VerificationView: View {
    
    @Binding var currentStep: OnboardingStep
    
    @State var verificationCode = ""
    
    var body: some View {
        
        VStack {
            
            Text("Verification")
                .font(Font.titleText)
                .padding(.top, 52)
            
            Text("Enter the 6-digit verification code we sent to your device.")
                .font(Font.bodyParagraph)
                .padding(.top, 12)
            
            // TextField
            ZStack {
                
                Rectangle()
                    .frame(height: 56)
                    .foregroundColor(Color("input"))
                
                HStack {
                    TextField("", text: $verificationCode)
                        .font(Font.bodyParagraph)
                    
                    Spacer()
                    
                    Button {
                        // Clear text field
                        verificationCode = ""
                        
                    } label: {
                        Image(systemName: "multiply.circle.fill")
                    }
                    .frame(width: 19, height: 19)
                    .tint(Color("icons-input"))
                }
                .padding()
                
            }
            .padding(.top, 34)
            
            Spacer()
            
            Button {
                // Next step
                currentStep = .profile
                
            } label: {
                Text("Next")
            }
            .buttonStyle(OnboardingButtonStyle())
            .padding(.bottom, 87)

            
        }
        .padding(.horizontal)
        
    }
}

struct VerificationView_Previews: PreviewProvider {
    static var previews: some View {
        VerificationView(currentStep: .constant(.verification))
    }
}
