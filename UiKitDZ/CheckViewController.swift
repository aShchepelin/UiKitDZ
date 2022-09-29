//
//  CheckViewController.swift
//  UiKitDZ
//
//  Created by Александр Андреевич Щепелин on 28.09.2022.
//

import UIKit
/// Экран для выдачи чека + обратная связь в аллерте.
class CheckViewController: UIViewController {
    
// MARK: - Visual Components
    
    let orderLabel: UILabel = {
        let label = UILabel()
        label.text = "Ваш заказ:"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .systemGray
        label.frame = CGRect(x: 50, y: 150, width: 200, height: 40)
        return label
    }()
    
    let pizzaLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .systemGray
        label.frame = CGRect(x: 50, y: 200, width: 200, height: 40)
        return label
    }()
    
    let ingridientsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.text = """
"""
        label.numberOfLines = 5
        label.textColor = .systemGray
        label.frame = CGRect(x: 50, y: 250, width: 300, height: 200)
        return label
    }()
    
    let cardLabel: UILabel = {
        let label = UILabel()
        label.text = "Оплата картой"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = .systemGray
        label.frame = CGRect(x: 90, y: 600, width: 200, height: 30)
        return label
    }()
    
    let cashLabel: UILabel = {
        let label = UILabel()
        label.text = "Наличными"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = .systemGray
        label.frame = CGRect(x: 90, y: 650, width: 200, height: 30)
        return label
    }()
    
    lazy var cardSwitch: UISwitch = {
        let cardSwitch = UISwitch()
        cardSwitch.isOn = true
        cardSwitch.frame = CGRect(x: 290, y: 600, width: 30, height: 30)
        cardSwitch.addTarget(self, action: #selector(cardSwitchCheck), for: .valueChanged)
        return cardSwitch
    }()
    
    lazy var cashSwitch: UISwitch = {
        let cashSwitch = UISwitch()
        cashSwitch.frame = CGRect(x: 290, y: 650, width: 30, height: 30)
        cashSwitch.addTarget(self, action: #selector(cashSwitchCheck), for: .valueChanged)
        return cashSwitch
    }()
    
    lazy var payButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 70, y: 700, width: 250, height: 50)
        button.layer.cornerRadius = 15
        button.setTitle("\u{F8FF} Pay", for: .normal)
        button.backgroundColor = .black
        button.titleLabel?.textColor = .white
        button.addTarget(self, action: #selector(orderAlert), for: .touchUpInside)
        return button
    }()
 
// MARK: - Public property
    weak var delegate: PopToRootVC?
    
// MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
// MARK: - Public methods
    
    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(pizzaLabel)
        view.addSubview(ingridientsLabel)
        view.addSubview(orderLabel)
        view.addSubview(cardLabel)
        view.addSubview(cashLabel)
        view.addSubview(cardSwitch)
        view.addSubview(cashSwitch)
        view.addSubview(payButton)
        if cardSwitch.isOn {
            cashSwitch.isOn = false
            cardSwitch.isOn = true
        } else {
            cardSwitch.isOn = false
            cashSwitch.isOn = true
        }
    }
    
    @objc func orderAlert() {
        let orderAlert = UIAlertController(title: "Заказ оплачен и будет доставлен в течении 15 минут!",
                                           message: "Приятного аппетита! Оставьте обратную связь о приложении.",
                                           preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.dismiss(animated: false)
            self.delegate?.goToRootViewController()
            guard let feedback = orderAlert.textFields?.first?.text else { return }
            print(feedback)
        }
       
        orderAlert.addTextField()
        orderAlert.addAction(okAction)
        present(orderAlert, animated: false)
    }
    
    @objc func cardSwitchCheck() {
        if cardSwitch.isOn {
            cashSwitch.isOn = false
        }
    }
    
    @objc func cashSwitchCheck() {
        if cashSwitch.isOn {
            cardSwitch.isOn = false
        }
    }
}
