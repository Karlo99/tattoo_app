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
    var offset: CGSize
    var dropPosition: CGPoint?
    var armSide: ArmSide?

    init(
        name: String,
        offset: CGSize = .zero,
        dropPosition: CGPoint? = nil,
        armSide: ArmSide? = nil
    ) {
        self.name = name
        self.offset = offset
        self.dropPosition = dropPosition
        self.armSide = armSide
    }
}

