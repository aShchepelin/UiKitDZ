//
//  SecondViewController.swift
//  UiKitDZ
//
//  Created by Александр Андреевич Щепелин on 01.10.2022.
//

import UIKit
/// Второй экран для таббара
class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tabBarControllerAction()
    }
    
    func tabBarControllerAction() {
        let tabVC = UITabBarController()
        let mainVC = UINavigationController(rootViewController: ThirdViewController())
        let thirdVC = UINavigationController(rootViewController: FourthViewController())
        tabVC.setViewControllers([mainVC, thirdVC], animated: true)
        tabVC.modalPresentationStyle = .fullScreen
        present(tabVC, animated: true)
    }
}
