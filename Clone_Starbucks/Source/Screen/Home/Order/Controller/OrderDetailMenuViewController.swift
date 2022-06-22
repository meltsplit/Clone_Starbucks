//
//  OrderDetailMenuViewController.swift
//  Clone_Starbucks
//
//  Created by 장석우 on 2022/06/17.
//

import Foundation
import UIKit
class OrderDetailMenuViewController : UIViewController{
   
    
    
    //MARK: - Properties
    var menuTitleText : String = ""
    var detailMenuData : [OrderDetailMenuDataModel] = OrderDetailMenuDataModel.menu_DetailMenu["추천"]!
    
    var orderData : [OrderDataModel] = []
    
    @IBOutlet weak var menuTitleLabel: UILabel!
    @IBOutlet weak var detailTableView: UITableView!
    
    private let searchNavBarBtn : UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 25 , height: 25))
        btn.setBackgroundImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        btn.tintColor = .darkGray
        btn.contentMode = .scaleAspectFit
        return btn
    }()
    
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setDelegate()
        setNavigationBarItem()
        
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "load2"), object: nil)

    }
    
    //MARK: - Custom Method
    private func setUI(){
        menuTitleLabel.text = menuTitleText
        self.title = menuTitleText
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: searchNavBarBtn)
        
    }
    private func setDelegate(){
        detailTableView.delegate = self
        detailTableView.dataSource = self
        
        let nib = UINib(nibName: String(describing:OrderDetailMenuTableViewCell.self), bundle: nil)
        detailTableView.register(nib, forCellReuseIdentifier: OrderDetailMenuTableViewCell.cellIdentifier)
    }
    
    private func setNavigationBarItem(){
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .darkGray
    }
    
    @IBAction func cartBtnPressed(_ sender: UIButton) {
        let cartVC = storyboard?.instantiateViewController(withIdentifier: "OrderCartViewController") as? OrderCartViewController
        cartVC?.orderData = orderData
        navigationController?.pushViewController(cartVC!, animated: true)
        
    }
    
    @objc func loadList(_ notification : NSNotification)
    {
        let data = notification.object as! OrderDataModel
        orderData.append(data)
        print("data 받았어~ \(orderData.count)")
    }
    
}
    //MARK: - Table View Delegate
extension OrderDetailMenuViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        detailMenuData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OrderDetailMenuTableViewCell.cellIdentifier, for: indexPath) as? OrderDetailMenuTableViewCell else {return UITableViewCell()}
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.setData(detailMenuData[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectVC = storyboard?.instantiateViewController(withIdentifier: "OrderSelectViewController") as! OrderSelectViewController
        
        let data = detailMenuData[indexPath.row]
            
        selectVC.menuImage = data.image
        selectVC.menuText = data.detailMenu
        selectVC.englishText = data.englishMenu
        selectVC.price = data.price
        
            
        
        
        
        navigationController?.pushViewController(selectVC, animated: true)
    }



}
