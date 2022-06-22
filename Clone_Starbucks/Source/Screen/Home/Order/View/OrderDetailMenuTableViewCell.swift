//
//  OrderDetailMenuTableViewCell.swift
//  Clone_Starbucks
//
//  Created by 장석우 on 2022/06/17.
//

import UIKit

class OrderDetailMenuTableViewCell: UITableViewCell {
    //MARK: - Properties
    
    @IBOutlet weak var menuImageView: UIImageView!
    @IBOutlet weak var detailMenuLabel: UILabel!
    @IBOutlet weak var englishMenuLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    //MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        menuImageView.makeCornerRound(radius: 4)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    //MARK: - Custom Method
    func setData(_ data: OrderDetailMenuDataModel){
        menuImageView.image = UIImage(named: data.image)
        detailMenuLabel.text = data.detailMenu
        englishMenuLabel.text = data.englishMenu
        priceLabel.text = "\(data.price)원"
        
    }
    
    
}
