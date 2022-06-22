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
    
    var orderData : [OrderDataModel] = []
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "load2"), object: nil)
    }
    
    //MARK: - Custom Method
    
    @IBAction func cartBtnPressed(_ sender: UIButton) {
        let cartVC = storyboard?.instantiateViewController(withIdentifier: "OrderCartViewController") as? OrderCartViewController
        cartVC?.orderData = orderData
        navigationController?.pushViewController(cartVC!, animated: true)
        
    }
    
    @objc func loadList(_ notification : NSNotification)
    {
        // 실행되는 부분...
        let data = notification.object as! OrderDataModel
        orderData.append(data)
        print("data 받았어~ \(data.menu)")
    }
    
}
