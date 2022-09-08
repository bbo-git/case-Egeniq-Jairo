//
//  InfoBubble.swift
//  case-Egenic-Jairo
//
//  Created by Jairo on 08/09/2022.
//

import UIKit

class InfoBubble: UIView {
    
    var stackview: UIStackView
    
    init?(catModel: CatModel?) {
        guard let catModel = catModel else { return nil }
        
        stackview = UIStackView(arrangedSubviews: catModel.info().map {
            let stack = UIStackView(arrangedSubviews: [
                CatInfoLabel(text: "\($0.0):"),
                CatInfoLabel(text: $0.1),
            ])
            stack.axis = .horizontal
            stack.distribution = .equalCentering
            return stack
        }
        )
        super.init(frame: .zero)
        
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.distribution = .equalSpacing
        addSubview(stackview)
        NSLayoutConstraint.activate([
            stackview.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 6),
            stackview.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -6),
            stackview.topAnchor.constraint(equalTo: topAnchor, constant: 6),
            stackview.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -6)
        ])
        
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        layer.cornerRadius = 8
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
