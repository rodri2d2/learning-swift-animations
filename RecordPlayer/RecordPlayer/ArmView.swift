//
//  ArmView.swift
//  RecordPlayer
//
//  Created by Rodrigo Candido on 23/6/23.
//

import SwiftUI

struct ArmView: View {
    
    @Binding var shouldRotateArm: Bool
    
    var body: some View {
        Image("playerArm")
            .resizable()
            .frame(width: 150, height: 150)
            .shadow(color: .gray, radius: 2)
            .rotationEffect(.degrees(-35), anchor: .topTrailing)
            .rotationEffect(.degrees(shouldRotateArm ? 8 : 0), anchor: .topTrailing)
            .animation(
                Animation.linear(duration: 2),
                value: shouldRotateArm
            )
            .offset(x: 70, y: -250)
    }
}

struct ArmView_Previews: PreviewProvider {
    static var previews: some View {
        ArmView(shouldRotateArm: .constant(true))
    }
}
