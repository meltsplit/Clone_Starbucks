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
    let realm = try! Realm()
    lazy var orderData = realm.objects(OrderData.self)
    lazy var selectedData = orderData.filter("select == true")
    
    @IBOutlet weak var selectAllBtn: UIButton!
    
    @IBOutlet weak var totalCountLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var orderBtn: UIButton!
    @IBOutlet weak var orderCartTableView: UITableView!
  
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
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
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
        totalCount = 0
        totalPrice = 0
        updateSelected()
        
        for data in selectedData{
            totalCount += data.count
            totalPrice += data.price * data.count
        }
    }
    
    func updateSelected(){
        selectedData = orderData.filter("select == true")
        if selectedData.count == 0 {
            orderBtn.configuration?.background.backgroundColor = .lightGray
        }
        else{
            orderBtn.configuration?.background.backgroundColor = Color.greenColor2
        }
    }
    //MARK: - IBAction

    @IBAction func deleteBtnPressed(_ sender: UIButton) {
        let popUpVC = storyboard?.instantiateViewController(withIdentifier: "OrderCartPopUpViewController") as! OrderCartPopUpViewController
        popUpVC.modalPresentationStyle = .overCurrentContext
      
        
        switch (sender.tag){
        case 0 :
            if selectedData.count == 0 {  //선택삭제
                popUpVC.situation = Situation.NoSelect
            }
            else{popUpVC.situation = Situation.DeleteSelect}
           
        case 1 : //전체삭제
            popUpVC.situation = Situation.DeleteAll
        default : print("")
        }
        
        present(popUpVC, animated: false)
        
        popUpVC.yesBtnCompletionClosure = {
            switch (popUpVC.situation){
            case Situation.NoSelect :
                print("do nothing")
            case Situation.DeleteSelect :
                try! self.realm.write {self.realm.delete(self.selectedData)}
            case Situation.DeleteAll:
                try! self.realm.write{ self.realm.deleteAll()  }
            }
        }
       
        
        orderCartTableView.reloadData()
    }
}

extension OrderCartViewController : CartCellUpdateDelegate{
    
    func updateCount(_ select: Bool, _ count: Int, _ index: IndexPath, _ row: Int) {
        try! realm.write {
            orderData[index.row].select = select
            orderData[index.row].count = count
        }
        getData()
    }

}

//MARK: - TableView

extension OrderCartViewController : UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderData.count

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: OrderCartTableViewCell.cellIdentifier, for: indexPath) as? OrderCartTableViewCell else { return UITableViewCell()}
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
        cell.delegate = self
        cell.setData(data: orderData[indexPath.row])
        cell.getIndexPath(indexPath, indexPath.row)
        

        return cell
    }
    
    
    
    
}
