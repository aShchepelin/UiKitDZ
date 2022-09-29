//
//  PizzaCompositionViewController.swift
//  UiKitDZ
//
//  Created by Александр Андреевич Щепелин on 29.09.2022.
//

import UIKit
/// Экран с информацией о составе пиццы и колориями
class PizzaCompositionViewController: UIViewController {
    
// MARK: - Visual Components
    
    let pizzaLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 119, y: 50, width: 200, height: 30)
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .systemGray
        return label
    }()
    
    let compositionLabel: UILabel = {
       let label = UILabel()
        label.text = """
"""
        label.font = UIFont.systemFont(ofSize: 25)
        label.textColor = .systemGray
        label.frame = CGRect(x: 0, y: 100, width: 300, height: 400)
        label.numberOfLines = 15
        return label
    }()
    
// MARK: - Public properties
    
    var composition = ""
    
// MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
// MARK: - Public methods
    
    func setupUI() {
        view.backgroundColor = .white
        compositionLabel.text = composition
        view.addSubview(compositionLabel)
        view.addSubview(pizzaLabel)
    }
}
