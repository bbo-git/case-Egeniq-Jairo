//
//  CatModel.swift
//  case-Egenic-Jairo
//
//  Created by Jairo on 08/09/2022.
//

import Foundation

struct CatModel: Decodable {
    
    var name: String
    var origin: String
    var dogFriendly: Int
    var energy: Int
    var image: CatImage?
    
    func info() -> [(String, String)] {
        return [
            ("name", name),
            ("origin", origin),
            ("🐶", "\(dogFriendly)"),
            ("⚡️", "\(energy)")
        ]
    }
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case origin = "origin"
        case dogFriendly = "dog_friendly"
        case energy = "energy_level"
        case image = "image"
    }
}
