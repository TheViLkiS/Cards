//
//  LaunchScreenController.swift
//  Cards
//
//  Created by Дмитрий Гусев on 12.12.2022.
//

import UIKit

class LaunchScreenController: UIViewController {

  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(starButtonView)
        


    }
    
    private func startButton() -> UIButton {
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        
        button.center.x = view.center.x
        button.center.y = view.center.y
        button.setTitle("Начать", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitleColor(UIColor.gray, for: .highlighted)
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemGray4
        
        button.addTarget(nil, action: #selector(startGame(_:)), for: .touchUpInside)
        
        
    return button
    }
    
    @objc func startGame(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "BoardGameController")
        self.present(vc!, animated: true)
    }
    lazy var starButtonView = startButton()
  
}
