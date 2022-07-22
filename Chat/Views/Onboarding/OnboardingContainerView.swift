//
//  OnboardingContainerView.swift
//  Chat
//
//  Created by Tony Dinh on 7/21/22.
//

import SwiftUI

enum OnboardingStep: Int {
    case welcome = 0
    case phoneNumber = 1
    case verification = 2
    case profile = 3
    case contacts = 4
}

struct OnboardingContainerView: View {
    
    @Binding var isOnboarding: Bool
    
    @State var currentStep: OnboardingStep = .welcome
    
    var body: some View {
        
        
        ZStack {
            
            Color("background")
                .ignoresSafeArea()
            
            switch(currentStep) {
                
            case .welcome:
                WelcomeView(currentStep: $currentStep)
                
            case .phoneNumber:
                PhoneNumberView(currentStep: $currentStep)
                
            case .verification:
                VerificationView(currentStep: $currentStep)
                
            case .profile:
                CreateProfileView(currentStep: $currentStep)
                
            case .contacts:
                SyncContactsView(isOnboarding: $isOnboarding)
            }
            
        }
        
    }
}

struct OnboardingContainerView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingContainerView(isOnboarding: .constant(true))
    }
}
