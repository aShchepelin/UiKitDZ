//
//  FoodViewController.swift
//  UiKitDZ
//
//  Created by Александр Андреевич Щепелин on 28.09.2022.
//

import UIKit
/// Экран выбора пиццы/роллов
final class FoodViewController: UIViewController {
  
// MARK: - Visual Components
    
    lazy var pizzaButton: UIButton = {
       let button = UIButton()
        button.setTitle("Пицца", for: .normal)
        button.layer.cornerRadius = 15
        button.backgroundColor = .systemOrange
        button.frame = CGRect(x: 50, y: 200, width: 300, height: 80)
        button.addTarget(self, action: #selector(pushPizzaViewControllerAction), for: .touchUpInside)
        return button
    }()
    
    let sushiButton: UIButton = {
        let button = UIButton()
         button.setTitle("Суши", for: .normal)
         button.layer.cornerRadius = 15
         button.backgroundColor = .systemTeal
         button.frame = CGRect(x: 50, y: 350, width: 300, height: 80)
         button.isEnabled = false
         return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
// MARK: - Lifecycle
    
    func setupUI() {
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true
        view.addSubview(pizzaButton)
        view.addSubview(sushiButton)
    }
    
// MARK: - Public methods
    
    @objc func pushPizzaViewControllerAction() {
                 let pizzaViewController = PizzaViewController()
                 pizzaViewController.title = "Pizza"
                 self.navigationController?.pushViewController(pizzaViewController, animated: true)
             }
}
