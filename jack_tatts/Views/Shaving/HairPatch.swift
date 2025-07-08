//
//  HairPatch.swift
//  jack_tatts
//
//  Created by Mariana Montoya on 7/7/25.
//

import Foundation

struct HairPatch: Identifiable {
    let id = UUID()
    var position: CGPoint
    var isVisible: Bool = true
}
