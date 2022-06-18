//
//  OrderCartViewController.swift
//  Clone_Starbucks
//
//  Created by 장석우 on 2022/06/18.
//

import Foundation
import UIKit
class OrderCartViewController : UIViewController {
    
    //MARK: - Properties
    @IBOutlet weak var orderBtn: UIButton!
    @IBOutlet weak var orderCartTableView: UITableView!
    
    var orderData : [OrderDataModel] = []
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setUI()
        setDelegate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(orderData.count)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unsetNavigationBar()
    }
    
    
    //MARK: - Custom Method
    
    private func setUI(){
        orderBtn.makeCornerRound(radius: 2)
    }
    
    private func setDelegate(){
        orderCartTableView.delegate = self
        orderCartTableView.dataSource = self
        
        let nib = UINib(nibName: String(describing: OrderCartTableViewCell.self), bundle: nil)
        orderCartTableView.register(nib, forCellReuseIdentifier: OrderCartTableViewCell.cellIdentifier)
    }
    private func setNavigationBar(){
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .white
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: "cartBar")
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        tabBarController?.tabBar.isHidden = true
        
    }
    
    private func unsetNavigationBar(){
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor.white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        tabBarController?.tabBar.isHidden = false
    }
    
    
   
    
}

//MARK: - TableView

extension OrderCartViewController : UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderData.count

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: OrderCartTableViewCell.cellIdentifier, for: indexPath) as? OrderCartTableViewCell else { return UITableViewCell()}
        cell.setData(data: orderData[indexPath.row])

        return cell
    }
    
    
    
    
}
