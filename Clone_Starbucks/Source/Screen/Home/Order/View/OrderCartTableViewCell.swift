//
//  OrderCartTableViewCell.swift
//  Clone_Starbucks
//
//  Created by 장석우 on 2022/06/18.
//

import UIKit

protocol CartCellUpdateDelegate{
    func updateCount(_ select : Bool,_ count : Int, _ index : IndexPath,_ row : Int)
}

class OrderCartTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    var delegate : CartCellUpdateDelegate?
    
    @IBOutlet weak var menuImageView: UIImageView!
    
    @IBOutlet weak var menuLabel: UILabel!
    
    @IBOutlet weak var englishMenuLabel: UILabel!
    @IBOutlet weak var kindLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var sumPriceLabel: UILabel!
    
    
    @IBOutlet weak var selectBtn: UIButton!
    
    @IBOutlet weak var minusBtn: UIButton!
    @IBOutlet weak var plusBtn: UIButton!
    
    private var count : Int = 0{
        didSet{countLabel.text = String(count)
            sumPriceLabel.text = "\(count * price)원"
        }
    }
    private var price = 0
    
    private var indexPath : IndexPath?
    private var row : Int?
    private var select : Bool = false
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
        minusBtn.makeCornerRound(radius: 2)
        plusBtn.makeCornerRound(radius: 2)
        minusBtn.makeBorder(width: 1, cgColor: UIColor.darkGray.cgColor)
        plusBtn.makeBorder(width: 1, cgColor: UIColor.darkGray.cgColor)
    }
    
    
    func setData(data : OrderData){
        count = data.count
        price = data.price
        
        menuImageView.image = UIImage(named: data.image)
        menuLabel.text = data.menu
        englishMenuLabel.text = data.engMenu
        kindLabel.text = "\(data.heat) | \(data.size) | \(data.cup)"
        countLabel.text = "\(data.count)"
        priceLabel.text = "\(data.price)원"
        sumPriceLabel.text = "\(data.price * data.count)원"
    }
    
    func getIndexPath(_ path: IndexPath, _ r : Int ){
        indexPath = path
        row = r
    }
    
    //MARK: - IBAction
    
    @IBAction func selectBtnPressed(_ sender: UIButton) {
        sender.isSelected.toggle()
        
        if sender.isSelected{ select = true }
        else { select = false }
        
        delegate?.updateCount(select ,count, indexPath!, row!)
    }
    
    
    @IBAction func plusMinusBtnPressed(_ sender: UIButton) {
        if sender == plusBtn {
            count = count < 20 ? count + 1 : 20
        }
        else {
            count = count > 0 ? count - 1 : 0
        }
        
        if select{
            delegate?.updateCount(select ,count, indexPath!, row!)
        }
    }
    
}
