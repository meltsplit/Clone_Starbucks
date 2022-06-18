//
//  OrderOrderViewController.swift
//  Clone_Starbucks
//
//  Created by 장석우 on 2022/06/18.
//

import Foundation
import UIKit
class OrderOrderViewController : UIViewController{
    
    //MARK: - Properties
    
    @IBOutlet weak var pageBarView: UIView!
    @IBOutlet weak var minusBtn: UIButton!
    @IBOutlet weak var plusBtn: UIButton!
    
    
    @IBOutlet weak var orderView: UIView!
    @IBOutlet weak var cartBtn: UIButton!
    @IBOutlet weak var orderBtn: UIButton!
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    //MARK: - Custom Method
    private func setUI(){
        pageBarView.makeCornerRound(radius: 2)
        
        minusBtn.makeCornerRound(radius: 2)
        plusBtn.makeCornerRound(radius: 2)
        
        cartBtn.makeCornerRound(radius: 2)
        orderBtn.makeCornerRound(radius: 2)
        
        
        minusBtn.makeBorder(width: 0.8, cgColor: UIColor.darkGray.cgColor)
        plusBtn.makeBorder(width: 0.8, cgColor: UIColor.darkGray.cgColor)
        cartBtn.makeBorder(width: 0.8, cgColor: UIColor(named: "StarbucksColor")!.cgColor)
        
        orderView.makeShadow(radius: 5, offset: CGSize(width: 0, height: -1), opacity: 0.2)
      
    }
}
