//
//  ViewController.swift
//  UiKitDZ
//
//  Created by Александр Андреевич Щепелин on 21.09.2022.
//

import UIKit
/// Экран входа с вводом номера и пароля с рабочим глазиком
class StartPageViewController: UIViewController {
 
// MARK: - Visual Components
    
    let logo: UIImageView = {
        var logo = UIImageView(frame: CGRect(x: 130,
                                             y: 130,
                                             width: 150,
                                             height: 100))
        logo.image = UIImage(systemName: "cloud.fill")
        logo.contentMode = .scaleToFill
        logo.tintColor = .lightGray
        return logo
    }()
    
    let nameLogo: UILabel = {
        let name = UILabel()
        name.text = "Bringo"
        name.textColor = .systemBlue
        name.frame = CGRect(x: 180, y: 170, width: 50, height: 30)
        return name
    }()
    
    let numberLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.textColor = .systemBlue
        label.frame = CGRect(x: 50, y: 400, width: 50, height: 30)
        return label
    }()
    
    let numberTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите номер"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        textField.frame = CGRect(x: 50, y: 430, width: 300, height: 30)
        return textField
    }()
    
    let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.textColor = .systemBlue
        label.frame = CGRect(x: 50, y: 500, width: 90, height: 30)
        return label
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите пароль"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.frame = CGRect(x: 50, y: 530, width: 300, height: 30)
        return textField
    }()
    
    lazy var passwordSecureButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "eye.fill"), for: .normal)
        button.tintColor = .systemGray
        button.frame = CGRect(x: 315, y: 538, width: 25, height: 15)
        button.addTarget(self, action: #selector(showPasswordAction), for: .touchUpInside)
        return button
    }()
    
    lazy var enterButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Enter", for: .normal)
        button.layer.cornerRadius = 15
        button.frame = CGRect(x: 90, y: 700, width: 200, height: 50)
        button.addTarget(self, action: #selector(pushFoodViewControllerAction), for: .touchUpInside)
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
        view.addSubview(logo)
        view.addSubview(nameLogo)
        view.addSubview(numberLabel)
        view.addSubview(numberTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(passwordSecureButton)
        view.addSubview(enterButton)
    }
    
    @objc func showPasswordAction() {
        guard passwordTextField.isSecureTextEntry else {
            passwordTextField.isSecureTextEntry = true
            passwordSecureButton.setBackgroundImage(UIImage(systemName: "eye.fill"), for: .normal)
            return
            }
        passwordSecureButton.setBackgroundImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        passwordTextField.isSecureTextEntry = false
            }
    
    @objc func pushFoodViewControllerAction() {
                 let foodViewController = FoodViewController()
        let navigationController = UINavigationController(rootViewController: foodViewController)
                 foodViewController.title = "Food"
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true)
             }
}
