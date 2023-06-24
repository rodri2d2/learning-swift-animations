//
//  ExpandDirection.swift
//  CustomComponent
//
//  Created by Rodrigo Candido on 24/6/23.
//

import Foundation

enum ExpandDirection {
    case top
    case bottom
    case right
    case left
    
    var offsets: (CGFloat, CGFloat) {
        switch self {
        case .top:
            return (-32, -62)
        case .bottom:
            return (32, 62)
        case .right:
            return (62, -32)
        case .left:
           return (-62, 32)
        }
    }
    
    var containerOffset: (CGFloat, CGFloat) {
        switch self {
        case .top:
            return (-18, -18)
        case .bottom:
            return (18, 18)
        case .right:
            return (18, -18)
        case .left:
            return (-18, 18)
        }
    }
}
