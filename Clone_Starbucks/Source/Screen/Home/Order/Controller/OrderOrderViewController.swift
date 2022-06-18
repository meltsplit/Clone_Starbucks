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
    
    var menu : String = ""
    
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
    
    @IBAction func orderBtnPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "주문 완료", message: "\(menu) 주문 완료되었습니다.", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "확인", style: .default) { (action) in
                }
        alert.addAction(okAction)
        present(alert, animated: false, completion: nil)
    }
    
}