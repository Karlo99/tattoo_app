//
//  SharableImage.swift
//  jack_tatts
//
//  Created by Mariana Montoya on 7/26/25.
//

import Foundation
import SwiftUI
import UniformTypeIdentifiers

struct ShareableImage: Transferable {
    let image: UIImage

    static var transferRepresentation: some TransferRepresentation {
        DataRepresentation(exportedContentType: .png) { shareable in
            guard let data = shareable.image.pngData() else {
                throw NSError(domain: "ShareableImage", code: 1, userInfo: [NSLocalizedDescriptionKey: "Failed to generate PNG data"])
            }
            return data
        }
    }
}
