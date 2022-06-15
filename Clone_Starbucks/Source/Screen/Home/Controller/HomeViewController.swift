//
//  HomeViewController.swift
//  Clone_Starbucks
//
//  Created by 장석우 on 2022/06/15.
//

import Foundation
import UIKit

class HomeViewController :UIViewController{
    
    @IBOutlet weak var cardRegisterView: UIView!
    @IBOutlet weak var registerLabel: UILabel!
    @IBOutlet weak var cardRegisterBtn: UIButton!
    
    @IBOutlet weak var event2ImageView: UIImageView!
    
    @IBOutlet weak var newsCollectionView: UICollectionView!
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        setNavigationBar()
        setUI()
    }
    //MARK: - Custom Method
    
    private func setNavigationBar(){
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setDelegate(){
        newsCollectionView.delegate = self
        newsCollectionView.dataSource = self
        
        let newsCollectionCellNib = UINib(nibName: String(describing: NewCollectionViewCell.self), bundle: nil)
        newsCollectionView.register(newsCollectionCellNib, forCellWithReuseIdentifier: "cell")
    }
    
    private func setUI(){
        makeShadow(view: cardRegisterView, radius: 4)
        makeShadow(view: event2ImageView, radius: 2)
        
        makeCornerRound(view: cardRegisterBtn, radius: 2)
    }
    
    private func makeShadow(view : UIView, radius : CGFloat){
        view.layer.shadowColor = UIColor.darkGray.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowRadius = radius
        view.layer.shadowOpacity = 0.3
        view.layer.masksToBounds = false
    }
    
    private func makeCornerRound (view : UIView, radius : CGFloat){
        view.layer.cornerRadius = cardRegisterBtn.bounds.size.height / radius
    }
}

//MARK: - Collection View
extension HomeViewController : UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return HomeNewsDataModel.sampleData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? NewCollectionViewCell else { return UICollectionViewCell() }
        
        cell.setData(HomeNewsDataModel.sampleData[indexPath.row])
        
        return cell
    }
    
    
    
    
    
}
