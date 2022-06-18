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
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    @IBOutlet weak var hotBtn: UIButton!
    @IBOutlet weak var icedBtn: UIButton!
    @IBOutlet weak var orderBtn: UIButton!
    
    @IBOutlet var similarCoffeeImageView: [UIImageView]!
    
    private let shareNavBarBtn : UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 25 , height: 25))
        btn.setBackgroundImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        btn.tintColor = .darkGray
        btn.contentMode = .scaleAspectFit
        return btn
    }()
    
    var menuImage : UIImage = Image.americano_HOT {
        didSet{
            menuImageView.image = menuImage
        }
        
    }
    var menuText :String = "" {
        didSet{
            menuLabel.text = menuText
        }
    }
    var descriptionText: String = "" {
        didSet{
            descriptionLabel.text = descriptionText
        }
    }
    
    
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setNavigation_Tab_Bar()
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
        hotBtn.layer.borderWidth = 0.5
        hotBtn.layer.borderColor = UIColor.lightGray.cgColor
        hotBtn.makeCornerRound(radius: 2)
        hotBtn.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMinXMaxYCorner)
        
        icedBtn.layer.borderWidth = 0.5
        icedBtn.layer.borderColor = UIColor.lightGray.cgColor
        icedBtn.makeCornerRound(radius: 2)
        icedBtn.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMaxXMinYCorner,.layerMaxXMaxYCorner)
        
        orderBtn.makeCornerRound(radius: 2)
        
        for i in similarCoffeeImageView{
            i.makeCornerRound(radius: 2.2)
        }
    }
    
    @IBAction func hotIcedBtnPressed(_ sender: UIButton) {
        
        if sender == hotBtn {
            hotBtn.isSelected = true
            icedBtn.isSelected = false
            hotBtn.backgroundColor = .red
            hotBtn.tintColor = .white
            icedBtn.backgroundColor = .white
            icedBtn.tintColor = .darkGray
        }
        else if sender == icedBtn{
            icedBtn.isSelected = true
            hotBtn.isSelected = false
            
            hotBtn.backgroundColor = .white
            hotBtn.tintColor = .darkGray
            
            icedBtn.backgroundColor = .blue
            icedBtn.tintColor = .white
        }
        
    }
    
    
}

