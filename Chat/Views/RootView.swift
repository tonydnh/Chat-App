//
//  RootView.swift
//  Chat
//
//  Created by Tony Dinh on 7/21/22.
//

import SwiftUI

struct RootView: View {
    
    @State var selectedTab: Tabs = .contacts
    
    @State var isOnboarding = !AuthViewModel.isUserLoggedIn()
    
    var body: some View {
        
        VStack {
        
        Text("Hello, world!")
            .padding()
            .font(Font.chatHeading)
            
            Spacer()
            
            CustomTabBar(selectedTab: $selectedTab)
        }
        .fullScreenCover(isPresented: $isOnboarding) {
            // On dismiss
        } content: {
            // The onboarding sequence
            OnboardingContainerView(isOnboarding: $isOnboarding)
        }

    }
    
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
