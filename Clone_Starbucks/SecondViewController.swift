//
//  ViewController.swift
//  Clone_Starbucks
//
//  Created by 장석우 on 2022/06/14.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var secondButton: UIButton!
    
    var message : String = "Default"
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Second VC - viewDidLoad")
        //secondLabel.text = message
        view.backgroundColor = .white
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Second VC - viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Second VC - viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Second VC - viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("Second VC - viewDidDisappear")
        print("------------------------")
    }
    //MARK: - Method
    
    @IBAction func secondBtnPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    


}

