//
//  loadTattooNames.swift
//  jack_tatts
//
//  Created by Mariana Montoya on 6/6/25.
//

import Foundation

func loadTattooNames() -> [String] {
    guard let url = Bundle.main.url(forResource: "tattoos", withExtension: "json"),
          let data = try? Data(contentsOf: url),
          let names = try? JSONDecoder().decode([String].self, from: data)
    else {
        return []
    }
    return names
}
