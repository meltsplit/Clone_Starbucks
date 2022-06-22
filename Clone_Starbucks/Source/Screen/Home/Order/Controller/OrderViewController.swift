//
//  OrderViewController.swift
//  Clone_Starbucks
//
//  Created by 장석우 on 2022/06/22.
//

import Foundation
import UIKit
class OrderViewController:UIViewController {
    
    //MARK: - Properties
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: - Custom Method
    
    @IBAction func cartBtnPressed(_ sender: UIButton) {
        let cartVC = storyboard?.instantiateViewController(withIdentifier: "OrderCartViewController") as? OrderCartViewController
        
        navigationController?.pushViewController(cartVC!, animated: true)
        
    }
    
}
