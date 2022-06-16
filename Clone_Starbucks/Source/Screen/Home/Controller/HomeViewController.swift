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
        newsCollectionView.register(newsCollectionCellNib, forCellWithReuseIdentifier: NewCollectionViewCell.cellIdentifier)
    }
    
    private func setUI(){
        cardRegisterView.makeShadow(radius: 4)
        event2ImageView.makeShadow(radius: 2)
        
        cardRegisterBtn.makeCornerRound(radius: 2)
    }
    
    
}

//MARK: - Collection View
extension HomeViewController : UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return HomeNewsDataModel.sampleData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewCollectionViewCell.cellIdentifier, for: indexPath) as? NewCollectionViewCell else { return UICollectionViewCell() }
        
        cell.setData(HomeNewsDataModel.sampleData[indexPath.row])
        
        return cell
    }
    
    
    
    
    
}
