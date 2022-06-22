//
//  OrderCartTableViewCell.swift
//  Clone_Starbucks
//
//  Created by 장석우 on 2022/06/18.
//

import UIKit

class OrderCartTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    
    @IBOutlet weak var menuImageView: UIImageView!
    
    @IBOutlet weak var menuLabel: UILabel!
    
    @IBOutlet weak var englishMenuLabel: UILabel!
    @IBOutlet weak var kindLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var sumPriceLabel: UILabel!
    
    //MARK: - Life Cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: - Custom Method
    
    private func setUI(){
        menuImageView.makeCornerRound(radius: 2)
    }
    
    
    func setData(data : OrderDataModel){
        menuImageView.image = data.image
        menuLabel.text = data.menu
        englishMenuLabel.text = data.engmenu
        priceLabel.text = data.price
        sumPriceLabel.text = data.price
    }
    
    
}
