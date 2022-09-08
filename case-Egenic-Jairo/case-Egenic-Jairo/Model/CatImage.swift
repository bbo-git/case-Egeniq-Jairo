//
//  CatImage.swift
//  case-Egenic-Jairo
//
//  Created by Jairo on 08/09/2022.
//

import Foundation

struct CatImage: Decodable {
    
    var id: String
    var width: Int
    var height: Int
    var url: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case width
        case height
        case url
    }
    
}
