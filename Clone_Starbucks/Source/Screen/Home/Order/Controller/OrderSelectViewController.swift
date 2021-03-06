//
//  OrderSelectViewController.swift
//  Clone_Starbucks
//
//  Created by 장석우 on 2022/06/18.
//

import Foundation
import UIKit
class OrderSelectViewController : UIViewController{
    
    //MARK: - Properties
    
    @IBOutlet weak var menuImageView: UIImageView!
    @IBOutlet weak var menuLabel: UILabel!
    @IBOutlet weak var englishMenuLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    @IBOutlet weak var hotBtn: UIButton!
    @IBOutlet weak var icedBtn: UIButton!
    
    @IBOutlet var heatBtnList: [UIButton]!
    
    @IBOutlet weak var orderBtn: UIButton!
    
    @IBOutlet var similarCoffeeImageView: [UIImageView]!
    
    private let shareNavBarBtn : UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 25 , height: 25))
        btn.setBackgroundImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        btn.tintColor = .darkGray
        btn.contentMode = .scaleAspectFit
        return btn
    }()
    
    var menuImage : String = ""
    var menuText : String = ""
    var englishText : String = ""
    var descriptionText: String = ""
    var heat : String = "ICED"
    var price : Int = 0
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setNavigation_Tab_Bar()
        setProperties()
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
    
    //MARK: - Custom Method
    
    private func setNavigation_Tab_Bar() {
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .darkGray
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: shareNavBarBtn)
        
        tabBarController?.tabBar.isHidden = true
    }
    
    private func setUI(){
        hotBtn.makeBorder(width: 0.5, cgColor: UIColor.lightGray.cgColor)
        hotBtn.makeCornerRound(radius: 2)
        hotBtn.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMinXMaxYCorner)
        
        icedBtn.makeBorder(width: 0.5, cgColor: UIColor.lightGray.cgColor)
        icedBtn.makeCornerRound(radius: 2)
        icedBtn.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMaxXMinYCorner,.layerMaxXMaxYCorner)
        
        orderBtn.makeCornerRound(radius: 2)
        
        for i in similarCoffeeImageView{
            i.makeCornerRound(radius: 2.2)
        }
    }
    
    private func setProperties(){
        menuImageView.image = UIImage(named: menuImage)
        menuLabel.text = menuText
        englishMenuLabel.text = englishText
    }
    
    @IBAction func hotIcedBtnPressed(_ sender: UIButton) {
        for btn in heatBtnList{
            if btn == sender{
                btn.isSelected = true
                btn.tintColor = .white
                btn.backgroundColor = btn == hotBtn ? .red : .blue
                heat = btn == hotBtn ? "HOT" : "ICED"
            }
            else{
                btn.isSelected = false
                btn.tintColor = .darkGray
                btn.backgroundColor = .white
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
        guard let orderVC = segue.destination as? OrderFinalViewController else {return }
        orderVC.menu = menuText
        orderVC.engmenu = englishText
        orderVC.price = price
        orderVC.image = menuImage
        orderVC.heat = heat
        }
    
    
    
}


