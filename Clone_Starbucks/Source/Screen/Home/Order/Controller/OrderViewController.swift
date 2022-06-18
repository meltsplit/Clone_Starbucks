//
//  OrderViewController.swift
//  Clone_Starbucks
//
//  Created by 장석우 on 2022/06/16.
//

import Foundation
import UIKit


class OrderViewController :UIViewController{
    //MARK: - Properties
    
    @IBOutlet weak var orderMenuTableView: UITableView!
    var orderData : [OrderDataModel] = []
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "load2"), object: nil)

        
    }
    //MARK: - Custom Method
 
    private func setDelegate(){
        
        orderMenuTableView.delegate = self
        orderMenuTableView.dataSource = self
        
        let myNib = UINib(nibName: String(describing: OrderMenuTableViewCell.self), bundle: nil)
        orderMenuTableView.register(myNib, forCellReuseIdentifier: OrderMenuTableViewCell.cellIdentifier)
    }
    
    
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

    //MARK: - TableView
extension OrderViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        OrderMenuDataModel.sampleData.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OrderMenuTableViewCell.cellIdentifier, for: indexPath) as? OrderMenuTableViewCell else {return UITableViewCell()}
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.setData(OrderMenuDataModel.sampleData[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailMenuVC = self.storyboard?.instantiateViewController(withIdentifier: "OrderDetailMenuViewController") as! OrderDetailMenuViewController
        
        let data : OrderMenuDataModel? = OrderMenuDataModel.sampleData[indexPath.row]
        
        detailMenuVC.menuTitleText = data!.menu
        detailMenuVC.detailMenuData = OrderDetailMenuDataModel.menu_DetailMenu[data!.menu]!
        
        
        navigationController?.pushViewController(detailMenuVC, animated: true)
    }
   

    
    
    
}
