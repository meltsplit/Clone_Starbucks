//
//  OrderCartPopUpViewController.swift
//  Clone_Starbucks
//
//  Created by 장석우 on 2022/06/26.
//

import Foundation
import UIKit
enum Situation {
    case NoSelect
    case DeleteSelect
    case DeleteAll
}
class OrderCartPopUpViewController : UIViewController{
    
    //MARK: - Properties
    
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var noBtn: UIButton!
    @IBOutlet weak var yesBtn: UIButton!
    
    var situation : Situation = Situation.NoSelect
    
    var yesBtnCompletionClosure : (() -> Void)?
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        configUI()
    }
    //MARK: - Custom Method
    private func setUI(){
        popUpView.makeCornerRound(radius: 10)
        popUpView.makeShadow(radius: 10 , offset: CGSize(width: 2, height: 7),opacity: 0.5)
        popUpView.makeShadow(radius: 10 , offset: CGSize(width: -2, height: -2),opacity: 0.5)
        
        noBtn.makeCornerRound(radius: 2)
        yesBtn.makeCornerRound(radius: 2)
        
        noBtn.makeBorder(width: 1, cgColor: Color.greenColor2.cgColor)
        yesBtn.makeBorder(width: 1, cgColor: UIColor.white.cgColor)
    }
    private func configUI(){
        switch (situation){
        case Situation.NoSelect:
            descriptionLabel.text = "장바구니에서 삭제하실 메뉴를 선택해주세요"
            noBtn.setTitle("확인", for: .normal)
            yesBtn.setTitle("확인", for: .normal)
        case Situation.DeleteSelect :
            descriptionLabel.text = "선택한 메뉴를 삭제하시겠습니까?"
            noBtn.setTitle("취소", for: .normal)
            yesBtn.setTitle("확인", for: .normal)
        case Situation.DeleteAll :
            descriptionLabel.text = "장바구니에 담긴 모든 메뉴를 삭제하시겠어요?"
            noBtn.setTitle("아니오", for: .normal)
            yesBtn.setTitle("전체삭제", for: .normal)
        }
        
    }
    @IBAction func btnPressed(_ sender: UIButton) {
        if sender == yesBtn {
            
            dismiss(animated: false, completion: nil)
            
            if let yesBtnCompletionClosure = yesBtnCompletionClosure {
                yesBtnCompletionClosure()
            }
        }
        else {
            dismiss(animated: false, completion: nil)
        }
        
    }
    
}

