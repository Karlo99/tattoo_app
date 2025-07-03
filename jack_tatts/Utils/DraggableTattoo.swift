//
//  DraggableTattoo.swift
//  jack_tatts
//
//  Created by Mariana Montoya on 6/6/25.
//

import Foundation
enum ArmSide {
    case left
    case right
}

struct DraggableTattoo: Identifiable {
    let id = UUID()
    let name: String
    var offset: CGSize = .zero
    var dropPosition: CGPoint? = nil
    var armSide: ArmSide? = nil
}
