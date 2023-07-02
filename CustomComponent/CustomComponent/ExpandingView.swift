//
//  ExpandingView.swift
//  CustomComponent
//
//  Created by Rodrigo Candido on 24/6/23.
//

import SwiftUI

struct ExpandingView: View {
    
    @Binding var isExapaded: Bool
    
    var direction: ExpandDirection
    var symbolName: String
    
    var body: some View {
        
        ZStack {
            ZStack {
                Image(systemName: symbolName)
                    .font(.system(size: 32, weight: .medium, design: .rounded))
                    .foregroundColor(.black)
                    .padding()
                    .scaleEffect(isExapaded ? 1 : 0 )
                    .rotationEffect(isExapaded ? .degrees(-43) : .degrees(0))
                    .animation(.easeInOut(duration: 0.15), value: isExapaded)
            }
            .frame(width: 82, height: 82)
            .background(Color.white)
            .cornerRadius(isExapaded ? 41 : 8)
            .scaleEffect(isExapaded ? 1 : 0.5)
            .offset(x: isExapaded ? direction.offsets.0 : 0, y: isExapaded ? direction.offsets.1 : 0)
            .rotationEffect(isExapaded ? .degrees(43) :.degrees(0))
            .animation(Animation.easeInOut(duration: 0.25).delay(0.05), value: isExapaded)
            .background(Color.red)
        }
        .offset(x: direction.containerOffset.0, y: direction.containerOffset.1)
        
    }
}

struct ExpandingView_Previews: PreviewProvider {
    static var previews: some View {
        ExpandingView(isExapaded: .constant(true), direction: .bottom, symbolName: "doc.fill")
    }
}
