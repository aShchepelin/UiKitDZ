//
//  PizzaViewController.swift
//  UiKitDZ
//
//  Created by Александр Андреевич Щепелин on 28.09.2022.
//

import Foundation
import UIKit
/// Экран выбора пиццы
class PizzaViewController: UIViewController {
    
// MARK: - Visual Components
    
    let pepperoniImage: UIImageView = {
        var pizza = UIImageView(frame: CGRect(x: 20,
                                                y: 230,
                                                width: 150,
                                                height: 150))
        pizza.image = UIImage(named: "pepperoni")
        pizza.contentMode = .scaleToFill
        return pizza
    }()
    
    var pepperoniLabel: UILabel {
        let label = UILabel()
        label.text = "Пепперони"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = .systemGray
        label.frame = CGRect(x: 190, y: 280, width: 300, height: 30)
        return label
    }
    
    let margaritaImage: UIImageView = {
        
        let pizza = UIImageView(frame: CGRect(x: 15,
                                              y: 430,
                                              width: 170,
                                              height: 170))
        pizza.image = UIImage(named: "margarita")
        pizza.contentMode = .scaleToFill
        return pizza
    }()
    
    var margaritaLabel: UILabel {
        let label = UILabel()
        label.text = "Маргарита"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = .systemGray
        label.frame = CGRect(x: 190, y: 500, width: 300, height: 30)
        return label
    }
    
    lazy var ingridientsForPepperonniButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "plus"), for: .normal)
        button.backgroundColor = .systemOrange
        button.frame = CGRect(x: 350, y: 280, width: 30, height: 30)
        button.layer.cornerRadius = 5
        button.tintColor = .white
        button.addTarget(self, action: #selector(pizzaSelect), for: .touchUpInside)
        return button
    }()
    
    lazy var ingridientsForMargaritaButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "plus"), for: .normal)
        button.backgroundColor = .systemOrange
        button.frame = CGRect(x: 350, y: 500, width: 30, height: 30)
        button.layer.cornerRadius = 5
        button.tintColor = .white
        button.addTarget(self, action: #selector(pizzaSelect), for: .touchUpInside)
        return button
    }()

// MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
// MARK: - Public methods
    
   func setupUI() {
       view.backgroundColor = .white
       view.addSubview(pepperoniImage)
       view.addSubview(pepperoniLabel)
       view.addSubview(margaritaImage)
       view.addSubview(margaritaLabel)
       view.addSubview(ingridientsForPepperonniButton)
       view.addSubview(ingridientsForMargaritaButton)
       backButton()
    }
    
    @objc func pizzaSelect() {
        let ingridientsVC = IngridientsViewController()
        if ingridientsForMargaritaButton.isTouchInside {
            ingridientsVC.pizza = "Маргарита"
            ingridientsVC.pizzaPic = "margarita"
            ingridientsVC.modalPresentationStyle = .formSheet
            ingridientsVC.title = "Ingridients"
            self.present(ingridientsVC, animated: true)
        } else if ingridientsForPepperonniButton.isTouchInside {
            ingridientsVC.pizza = "Пепперони"
            ingridientsVC.pizzaPic = "pepperoni"
            ingridientsVC.title = "Ingridients"
            ingridientsVC.modalPresentationStyle = .formSheet
            self.present(ingridientsVC, animated: true)
        }
    }
    
    func backButton() {
        let button = UIBarButtonItem()
        button.image = UIImage(systemName: "chevron.backward")
        navigationController?.navigationBar.topItem?.backButtonDisplayMode = .minimal
    }
    
}
