//
//  OrderTabmanViewController.swift
//  Clone_Starbucks
//
//  Created by 장석우 on 2022/06/22.
//

import Foundation
import Tabman
import Pageboy
import UIKit

class OrderTabmanViewController : TabmanViewController {
    
    //MARK: - Properties
    
    private var viewControllers : Array<UIViewController> = []
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var tabView: UIView!
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewController()
        setDelegate()
        setBar()
        topView.makeShadow(radius: 1 , offset: CGSize(width: 0, height: 1),opacity: 0.3)
    }
    
    //MARK: - Custom Method
    
    private func setViewController(){
        let totalMenuVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "OrderTotalMenuViewController") as! OrderTotalMenuViewController
        let myMenuVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "OrderMyMenuViewController") as! OrderMyMenuViewController
        
        viewControllers.append(totalMenuVC)
        viewControllers.append(myMenuVC)
    }
    
    private func setDelegate(){
        self.dataSource = self
    }
    
    private func setBar(){
        let bar = TMBar.ButtonBar()
        bar.layout.transitionStyle = .snap
        bar.backgroundView.style = .flat(color: .white)
        bar.buttons.customize { (button) in
            button.tintColor = .lightGray
            button.selectedTintColor = .black
        }
        bar.indicator.weight = .custom(value: 2.8)
        bar.indicator.tintColor = Color.greenColor
        bar.indicator.overscrollBehavior = .compress
        bar.layout.alignment = .centerDistributed
        bar.layout.contentMode = .fit
        // 버튼 사이 간격
           
        addBar(bar, dataSource: self, at: .custom(view: tabView, layout: nil))
    }
}

extension OrderTabmanViewController : PageboyViewControllerDataSource, TMBarDataSource{
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        switch index {
        case 0:
            return TMBarItem(title: "전체 메뉴")
        case 1:
            return TMBarItem(title: "나만의 메뉴")
            
        default:
            let title = "Page\(index)"
            return TMBarItem(title: title)
        }
    }
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        print(viewControllers.count)
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        nil
    }
    
    
    
    
    
}
