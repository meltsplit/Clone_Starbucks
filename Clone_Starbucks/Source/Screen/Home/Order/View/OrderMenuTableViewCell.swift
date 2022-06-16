//
//  OrderTableViewCell.swift
//  Clone_Starbucks
//
//  Created by 장석우 on 2022/06/16.
//

import UIKit

class OrderMenuTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    
    @IBOutlet weak var menuImageView: UIImageView!
    @IBOutlet weak var menuLabel: UILabel!
    @IBOutlet weak var englishMenuLabel: UILabel!
    
    //MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: - Custom Method
    
    func setData(_ data : OrderMenuDataModel ){
        menuImageView.image = UIImage(named: data.image)
        menuLabel.text = data.menu
        englishMenuLabel.text = data.englishMenu
    }
    
}
