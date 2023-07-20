//
//  OnBoardingVIew.swift
//  Attendulator
//
//  Created by Jay Bhensdadia on 20/07/23.
//

import SwiftUI

struct OnBoardingView: View {
    
    var onboardingMessages: [Message] = messages
    
    var body: some View {
        TabView {
            ForEach(onboardingMessages) { item in
                  OnboardingMessageView(message: item)
                    
                } //: LOOP
              } //: TAB
              .tabViewStyle(PageTabViewStyle())
              .padding(.vertical, 20)
    }
}

struct OnBoardingVIew_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
