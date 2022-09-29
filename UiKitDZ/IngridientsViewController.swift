//
//  IngridientsViewController.swift
//  UiKitDZ
//
//  Created by Александр Андреевич Щепелин on 28.09.2022.
//

import Foundation
import UIKit

/// Протокол для перехода на рутовый вью контроллер
protocol PopToRootVC: AnyObject {
    func goToRootViewController()
}
/// Экран с выбором ингридиентов для пиццы
class IngridientsViewController: UIViewController {
    
// MARK: - Visual Components
    
    let pizzaLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 119, y: 50, width: 200, height: 30)
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .systemGray
        return label
    }()
    
    let pizzaUIImage: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 50, y: 100, width: 300, height: 300))
        return image
    }()
    
    let cheeseLabel: UILabel = {
        let cheese = UILabel()
        cheese.text = "Сыр мацарелла"
        cheese.textColor = .systemGray
        cheese.frame = CGRect(x: 20, y: 500, width: 200, height: 30)
        return cheese
    }()
    
    let cheeseSwitch: UISwitch = {
       let cheese = UISwitch()
        cheese.frame = CGRect(x: 300, y: 500, width: 30, height: 30)
        return cheese
    }()
    
    let hamLabel: UILabel = {
        let ham = UILabel()
        ham.text = "Ветчина"
        ham.textColor = .systemGray
        ham.frame = CGRect(x: 20, y: 550, width: 200, height: 30)
        return ham
    }()
    
    let hamSwitch: UISwitch = {
       let ham = UISwitch()
        ham.frame = CGRect(x: 300, y: 550, width: 30, height: 30)
        return ham
    }()
    
    let mashroomLabel: UILabel = {
        let mashroom = UILabel()
        mashroom.text = "Грибы"
        mashroom.textColor = .systemGray
        mashroom.frame = CGRect(x: 20, y: 600, width: 200, height: 30)
        return mashroom
    }()
    
    let mashroomSwitch: UISwitch = {
       let mashroom = UISwitch()
        mashroom.frame = CGRect(x: 300, y: 600, width: 30, height: 30)
        return mashroom
    }()
    
    let oliveLabel: UILabel = {
        let olive = UILabel()
        olive.text = "Маслины"
        olive.textColor = .systemGray
        olive.frame = CGRect(x: 20, y: 650, width: 200, height: 30)
        return olive
    }()
    
    let oliveSwitch: UISwitch = {
       let olive = UISwitch()
        olive.frame = CGRect(x: 300, y: 650, width: 30, height: 30)
        return olive
    }()
    
    lazy var chooseButton: UIButton = {
        let button = UIButton()
        button.setTitle("Выбрать", for: .normal)
        button.backgroundColor = .systemOrange
        button.layer.cornerRadius = 15
        button.frame = CGRect(x: 70, y: 700, width: 250, height: 50)
        button.addTarget(self, action: #selector(pushCheckVC), for: .touchUpInside)
        return button
    }()
    
    lazy var pizzaCompasitionButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemOrange
        button.setTitle("Состав", for: .normal)
        button.layer.cornerRadius = 15
        button.frame = CGRect(x: 200, y: 450, width: 150, height: 40)
        button.addTarget(self,
                         action: #selector(presentPizzaCompasitionViewController),
                         for: .touchUpInside)
        return button
    }()
    
// MARK: - Public properties
    
    var pizza = ""
    var pizzaPic = ""
    
// MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
// MARK: - Public methods
    
    func setupUI() {
        view.backgroundColor = .white
        pizzaLabel.text = pizza
        view.addSubview(pizzaLabel)
        pizzaUIImage.image = UIImage(named: pizzaPic)
        view.addSubview(pizzaUIImage)
        view.addSubview(cheeseLabel)
        view.addSubview(cheeseSwitch)
        view.addSubview(hamLabel)
        view.addSubview(hamSwitch)
        view.addSubview(mashroomLabel)
        view.addSubview(mashroomSwitch)
        view.addSubview(oliveLabel)
        view.addSubview(oliveSwitch)
        view.addSubview(chooseButton)
        view.addSubview(pizzaCompasitionButton)
    }
    
    func goToRottViewController() {
        self.dismiss(animated: false)
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func presentPizzaCompasitionViewController() {
        let pizzaCompasitionViewController = PizzaCompositionViewController()
        pizzaCompasitionViewController.pizzaLabel.text = pizza
        if pizza == "Маргарита" {
            pizzaCompasitionViewController.composition = """
            Состав:
            тесто для пиццы
            соус томатный
            сыр Моцарелла
            помидоры
            базилик зелёный
            масло оливковое.
            Каллории: 1000
"""
        }
        if pizza == "Пепперони" {
            pizzaCompasitionViewController.composition = """
            Состав:
            тесто для пиццы
            соус томатный
            сыр Моцарелла
            помидоры
            базилик зелёный
            масло оливковое.
            колбаса Пепперони
            перец черный
            чеснок
            лук
            Каллории: 1500
"""
            }
        pizzaCompasitionViewController.modalPresentationStyle = .formSheet
        present(pizzaCompasitionViewController, animated: true)
    }
    
    @objc func pushCheckVC() {
        let checkViewController = CheckViewController()
        let navigationControllerTwo = UINavigationController(rootViewController: checkViewController)
        checkViewController.pizzaLabel.text = pizza
        var ingridients = ""
        if cheeseSwitch.isOn == true {
            ingridients += "Сыр моцарелла\n"
        }
        if hamSwitch.isOn == true {
            ingridients += "Ветчина\n"
        }
        if mashroomSwitch.isOn == true {
            ingridients += "Грибы\n"
        }
        if oliveSwitch.isOn == true {
            ingridients += "Маслины\n"
        }
        checkViewController.title = "Оплата"
        checkViewController.ingridientsLabel.text = ingridients
        navigationControllerTwo.modalPresentationStyle = .fullScreen
        checkViewController.delegate = self
        present(navigationControllerTwo, animated: true)
    }
}

/// Расширение с для перехода на второй экран

extension IngridientsViewController: PopToRootVC {
    func goToRootViewController() {
        if let navigationViewControllerOne = self.presentingViewController as? UINavigationController {
            self.view.isHidden = true
            dismiss(animated: false)
            navigationViewControllerOne.popToRootViewController(animated: false)
        }

    }
}
