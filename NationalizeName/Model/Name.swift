//
//  Name.swift
//  NationalizeName
//
//  Created by Giorgio Giannotta on 14/01/23.
//

import Foundation

struct Name: Codable {
    let country: [Country]
    let name: String
}

