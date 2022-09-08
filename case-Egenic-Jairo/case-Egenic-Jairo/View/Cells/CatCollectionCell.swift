//
//  CatCollectionCellCollectionViewCell.swift
//  case-Egenic-Jairo
//
//  Created by Jairo on 08/09/2022.
//

import UIKit
import SDWebImage

class CatCollectionCell: UICollectionViewCell {
    
    var imageView = UIImageView()
    var model: CatModel? {
        didSet {
            self.infoBubble = InfoBubble(catModel: self.model)
            imageView.sd_setImage(with: URL(string: model?.image?.url ?? ""))
        }
    }
    var infoBubble: InfoBubble!
    
    override var reuseIdentifier: String? {
        return "CatCell"
    }
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func composeViews() {
        contentView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
                
        contentView.addSubview(infoBubble)
        NSLayoutConstraint.activate([
            infoBubble.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 17),
            infoBubble.widthAnchor.constraint(equalToConstant: 120),
            infoBubble.heightAnchor.constraint(equalToConstant: 60),
            infoBubble.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -17)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
