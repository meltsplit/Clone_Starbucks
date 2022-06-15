//
//  NewCollectionViewCell.swift
//  Clone_Starbucks
//
//  Created by 장석우 on 2022/06/15.
//

import UIKit

class NewCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.cornerRadius = imageView.bounds.size.height / 7
    }
    
    internal func setData(_ data: HomeNewsDataModel){
        imageView.image = UIImage(named: data.image)
        titleLabel.text = data.title
        descriptionLabel.text = data.description
    }

    
    
    
}
