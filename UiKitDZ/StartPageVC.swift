//
//  ViewController.swift
//  UiKitDZ
//
//  Created by Александр Андреевич Щепелин on 21.09.2022.
//

import UIKit
/// Экран входа в приложение
class StartPageViewController: UIViewController {

    let logo: UIImageView = {
        var logo = UIImageView(frame: CGRect(x: -50,
                                             y: 0,
                                             width: 500,
                                             height: 500))
        logo.image = UIImage(named: "StoreLogo.jpg.png")
        return logo
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.textColor = .systemBlue
        label.frame = CGRect(x: 50, y: 400, width: 50, height: 30)
        return label
    }()
    
    let emailTextField: UITextField = {
       let textField = UITextField()
        textField.placeholder = "Введите Email"
        textField.borderStyle = .roundedRect
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
        button.addTarget(self, action: #selector(pushChooseBukeVCAction), for: .touchUpInside)
        return button
    }()
    
    let rememberEnter: UISwitch = {
        let rememberSwitch = UISwitch()
        rememberSwitch.frame = CGRect(x: 290, y: 600, width: 70, height: 40)
        return rememberSwitch
    }()
    
    let rememberLabel: UILabel = {
        let label = UILabel()
        label.text = "Remember this account?"
        label.textColor = .systemBlue
        label.frame = CGRect(x: 90, y: 600, width: 200, height: 30)
        return label
    }()
   
    override func viewDidLoad() {
        view.backgroundColor = .white
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }
    
    func setupUI() {
        view.addSubview(logo)
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(passwordSecureButton)
        view.addSubview(enterButton)
        view.addSubview(rememberEnter)
        view.addSubview(rememberLabel)
    }
    
    @objc func showPasswordAction() {
        if passwordTextField.isSecureTextEntry {
            passwordSecureButton.setBackgroundImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
            passwordTextField.isSecureTextEntry = false
        } else {
            passwordTextField.isSecureTextEntry = true
            passwordSecureButton.setBackgroundImage(UIImage(systemName: "eye.fill"), for: .normal)
        }
    }
    
    @objc func pushChooseBukeVCAction() {
            let chooseBikeVC = ChooseBikeViewController()
            chooseBikeVC.title = "Bike Lab Store"
            self.navigationController?.pushViewController(chooseBikeVC, animated: true)
        }

}
