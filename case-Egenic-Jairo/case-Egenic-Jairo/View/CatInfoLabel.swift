//
//  CatLabel.swift
//  case-Egenic-Jairo
//
//  Created by Jairo on 08/09/2022.
//

import UIKit

class CatInfoLabel: UILabel {
    
    init(text: String) {
        super.init(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        
        translatesAutoresizingMaskIntoConstraints = false
        
        font = UIFont(name: "Courier", size: 11)
        self.text = text
        sizeToFit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
