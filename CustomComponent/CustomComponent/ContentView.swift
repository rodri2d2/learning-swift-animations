//
//  ContentView.swift
//  CustomComponent
//
//  Created by Rodrigo Candido on 24/6/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var isAnimating = false
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
                
            ZStack {
                ExpandingView(isExapaded: $isAnimating, direction: .bottom, symbolName: "note.text")
                ExpandingView(isExapaded: $isAnimating, direction: .top, symbolName: "doc")
                ExpandingView(isExapaded: $isAnimating, direction: .right, symbolName: "photo")
                ExpandingView(isExapaded: $isAnimating, direction: .left, symbolName: "mic.fill")
                
                //
                Image(systemName: "plus")
                    .font(
                        .system(size: 40, weight: isAnimating ? .regular : .semibold,
                                design: .rounded
                               )
                    )
                    .foregroundColor(isAnimating ? .white : .black)
                    .rotationEffect(isAnimating ? .degrees(45) : .degrees(0))
                    .scaleEffect(isAnimating ? 3 : 1)
                    .opacity(isAnimating ? 0.5 : 1)
                    .animation(Animation.spring(response: 0.35, dampingFraction: 0.85, blendDuration: 1), value: isAnimating)
                    .onTapGesture {
                        isAnimating.toggle()
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
