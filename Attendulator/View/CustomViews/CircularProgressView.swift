//
//  CircularProgressView.swift
//  Attendulator
//
//  Created by Jay Bhensdadia on 16/07/23.
//

import SwiftUI

struct CircularProgressView: View {
    var progress: Float
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 10.0)
                .opacity(0.3)
                .foregroundColor(Color.cyan)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 10.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color.cyan)
                .rotationEffect(Angle(degrees: 270.0))
                
        }
    }
}

//struct CircularProgressView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        CircularProgressView()
//    }
//}
