//
//  OrderOrderViewController.swift
//  Clone_Starbucks
//
//  Created by 장석우 on 2022/06/18.
//

import Foundation
import UIKit
import RealmSwift

class OrderOrderViewController : UIViewController{
    
    //MARK: - Properties
    
    let realm = try! Realm()
    
    @IBOutlet weak var pageBarView: UIView!
    
    
    @IBOutlet weak var tallBtn: UIButton!
    @IBOutlet weak var grandeBtn: UIButton!
    @IBOutlet weak var ventiBtn: UIButton!
    @IBOutlet var sizeBtnList: [UIButton]!
    
    @IBOutlet weak var shopCupBtn: UIButton!
    @IBOutlet weak var myCupBtn: UIButton!
    @IBOutlet weak var plasticCupBtn: UIButton!
    @IBOutlet var cupBtnList: [UIButton]!
    
    
    @IBOutlet weak var minusBtn: UIButton!
    @IBOutlet weak var plusBtn: UIButton!
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    @IBOutlet weak var orderView: UIView!
    @IBOutlet weak var cartBtn: UIButton!
    @IBOutlet weak var orderBtn: UIButton!
    
    var menu : String = ""
    var engmenu : String = ""
    var price : Int = 0
    
    var ice : String = "ICED"
    var size : String = "Tall"
    var cup : String = "매장컵"
    var count : Int = 1
    
    var image : UIImage = UIImage()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    //MARK: - Custom Method
    private func setUI(){
        pageBarView.makeCornerRound(radius: 2)
        
        tallBtn.setTitle("Tall", for: .disabled)
        grandeBtn.setTitle("Grande", for: .disabled)
        ventiBtn.setTitle("Venti", for: .disabled)
        
        shopCupBtn.makeBorder(width: 0.5, cgColor: UIColor.lightGray.cgColor)
        shopCupBtn.makeCornerRound(radius: 2)
        shopCupBtn.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMinXMaxYCorner)
        shopCupBtn.setTitle("매장컵", for: .disabled)
        
        myCupBtn.makeBorder(width: 0.5, cgColor: UIColor.lightGray.cgColor)
        myCupBtn.setTitle("개인컵", for: .disabled)
        
        plasticCupBtn.makeBorder(width: 0.5, cgColor: UIColor.lightGray.cgColor)
        plasticCupBtn.makeCornerRound(radius: 2)
        plasticCupBtn.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMaxXMinYCorner,.layerMaxXMaxYCorner)
        plasticCupBtn.setTitle("일회용컵", for: .disabled)
        
     
        minusBtn.makeCornerRound(radius: 2)
        plusBtn.makeCornerRound(radius: 2)
        cartBtn.makeCornerRound(radius: 2)
        orderBtn.makeCornerRound(radius: 2)
        
        minusBtn.makeBorder(width: 0.8, cgColor: UIColor.darkGray.cgColor)
        plusBtn.makeBorder(width: 0.8, cgColor: UIColor.darkGray.cgColor)
        cartBtn.makeBorder(width: 0.8, cgColor: UIColor(named: "StarbucksColor")!.cgColor)
        
        orderView.makeShadow(radius: 5, offset: CGSize(width: 0, height: -1), opacity: 0.2)
    }
    
    @IBAction func sizeBtnPressed(_ sender: UIButton) {
        for btn in sizeBtnList {
                   if btn == sender {
                       btn.isSelected = true
                       btn.configuration?.background.image = UIImage(named: "\(btn.title(for: .disabled)!).fill")
                       size = btn.title(for: .disabled)!
                       
                   } else {
                       // 이 함수를 호출한 버튼이 아니라면
                       btn.isSelected = false
                       btn.configuration?.background.image = UIImage(named: "\(btn.title(for: .disabled)!)")
                       
                   }
               }
    }
    
    @IBAction func cupBtnPressed(_ sender: UIButton) {
        for btn in cupBtnList {
                   if btn == sender {
                       btn.isSelected = true
                       btn.tintColor = .white
                       btn.configuration?.background.backgroundColor = Color.greenColor2
                       btn.configuration?.background.cornerRadius = 0
                       
                       cup = btn.title(for: .disabled)!
                       print(cup)
                       
                   } else {
                       // 이 함수를 호출한 버튼이 아니라면
                       btn.isSelected = false
                       btn.tintColor = .darkGray
                       btn.configuration?.background.backgroundColor = .white
                       
                   }
               }
    }
    
    
    
    
    
    
    
    @IBAction func countBtnPressed(_ sender: UIButton) {
        if plusBtn == sender {
            count = count < 20 ? count + 1 : 20
            countLabel.text = String(count)
        }
        else {
            count = count > 0 ? count - 1 : 0
            countLabel.text = String(count)
        }
        
    }
    
    
    
    
    
    
    
    
    
    @IBAction func orderBtnPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "주문 완료", message: "\(menu) 주문 완료되었습니다.", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "확인", style: .default) { (action) in
            self.dismiss(animated: true)
        }
        alert.addAction(okAction)
        present(alert, animated: false, completion: nil)
        
    }
    
    @IBAction func cartBtnPressed(_ sender: UIButton) {
        //TODO
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load2"), object: OrderDataModel(image: image, menu: menu, engmenu: engmenu, price: price))
        print("send Data : \(menu)")
        dismiss(animated: true)
    }
    
}
