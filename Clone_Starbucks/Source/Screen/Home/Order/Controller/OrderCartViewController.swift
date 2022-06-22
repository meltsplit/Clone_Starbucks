//
//  OrderCartViewController.swift
//  Clone_Starbucks
//
//  Created by 장석우 on 2022/06/18.
//

import Foundation
import UIKit
import RealmSwift
class OrderCartViewController : UIViewController {
    
    //MARK: - Properties
    
    
    @IBOutlet weak var totalCountLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var orderBtn: UIButton!
    @IBOutlet weak var orderCartTableView: UITableView!
    
    let realm = try! Realm()
    lazy var orderData = realm.objects(OrderData.self)
    
    private var totalCount : Int = 0 {
        didSet {totalCountLabel.text = "총 \(totalCount)개/ 20개"}
    }
    private var totalPrice : Int = 0{
        didSet{
            totalPriceLabel.text = "\(totalPrice)원"
        }
    }
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setUI()
        setDelegate()
        getData()
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
    
    private func getData(){
        for data in orderData{
            totalCount += data.count
            totalPrice += data.price * data.count
        }
        print(Realm.Configuration.defaultConfiguration.fileURL!)
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
