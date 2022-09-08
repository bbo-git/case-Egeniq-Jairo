//
//  CatsLayout.swift
//  case-Egenic-Jairo
//
//  Created by Jairo on 08/09/2022.
//

import UIKit

class CatsLayout: UICollectionViewFlowLayout {

    init(size: CGSize) {
        super.init()
        
        itemSize = size
        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
        scrollDirection = .vertical
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
