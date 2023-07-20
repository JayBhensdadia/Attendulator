//
//  OnboardingMessageView.swift
//  Attendulator
//
//  Created by Jay Bhensdadia on 20/07/23.
//

import SwiftUI

struct OnboardingMessageView: View {
    
    var message: Message
    @State private var isAnimating: Bool = false
    
    var body: some View {
        ZStack{
            VStack(spacing: 20){
                Image(message.image)
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                    .scaleEffect(isAnimating ? 1.0 : 0.6)
                
                Text(message.title)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 2, x: 2, y: 2)
                
                Text(message.headline)
                    .font(.title2)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 16)
                    .frame(maxWidth: 480)
                
                StartButtonView()
            }
        }
        .onAppear {
            withAnimation(.easeOut(duration: 0.5)) {
                isAnimating = true
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(LinearGradient(gradient: Gradient(colors: [.cyan,.blue]), startPoint: .top, endPoint: .bottom))
        .cornerRadius(20)
        .padding(.horizontal, 20)
    }
}

struct OnboardingMessageView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingMessageView(message: Message(title: "Details", headline: "fill up semester details like starting date, ending dates and subjects", image: "update_profile"))
    }
}
