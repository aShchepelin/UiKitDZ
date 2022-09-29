//
//  ViewController.swift
//  UiKitDZ
//
//  Created by Александр Андреевич Щепелин on 21.09.2022.
//

import UIKit
/// Отрисовка стартового экрана с функциональным глазиком
class StartPageViewController: UIViewController {

    let birthdayLabel: UILabel = {
        let label = UILabel()
        label.text = "Birthday reminder"
        label.frame = CGRect(x: 100, y: 100, width: 200, height: 80)
        label.textAlignment = .center
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.systemBlue.cgColor
        return label
    }()
    
    let signLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign in"
        label.font = .boldSystemFont(ofSize: 25)
        label.frame = CGRect(x: 70, y: 300, width: 100, height: 30)
        return label
    }()
    
    let emailLabel: UILabel = {
       let label = UILabel()
        label.text = "Email"
        label.textColor = .systemBlue
        label.font = .systemFont(ofSize: 15)
        label.frame = CGRect(x: 70, y: 340, width: 40, height: 30)
        return label
    }()
    
    let emailTextField: UITextField = {
       let textField = UITextField()
        textField.font = .systemFont(ofSize: 16)
        textField.borderStyle = .roundedRect
        textField.frame = CGRect(x: 70, y: 370, width: 250, height: 25)
        return textField
    }()
    
    let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.textColor = .systemBlue
        label.font = .systemFont(ofSize: 15)
        label.frame = CGRect(x: 70, y: 430, width: 70, height: 30)
        return label
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
         textField.font = .systemFont(ofSize: 16)
         textField.borderStyle = .roundedRect
         textField.isSecureTextEntry = true
         textField.frame = CGRect(x: 70, y: 460, width: 250, height: 25)
         return textField
    }()
    
private lazy var eyeButton: UIButton = {
       let eye = UIButton()
        eye.setBackgroundImage(UIImage(systemName: "eye.fill"), for: .normal)
        eye.tintColor = .systemGray
        eye.frame = CGRect(x: 290, y: 465, width: 25, height: 15)
        eye.addTarget(self, action: #selector(showPasswordAction), for: .touchUpInside)
        return eye
    }()
    
    let faceIDLabel: UILabel = {
        let label = UILabel()
        label.text = "Вход по Face ID"
        label.font = .boldSystemFont(ofSize: 15)
        label.frame = CGRect(x: 140, y: 520, width: 130, height: 30)
        return label
    }()
    
    let faceIDSwitch: UISwitch = {
        let faceIDSwitch = UISwitch()
        faceIDSwitch.frame = CGRect(x: 270, y: 520, width: 70, height: 70)
        return faceIDSwitch
    }()
    
private lazy var enterButton: UIButton = {
       let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.backgroundColor = .systemBlue
        button.frame = CGRect(x: 70, y: 590, width: 250, height: 40)
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(pushBirthdayListAction), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        
    }
    func setupUI() {
        view.addSubview(birthdayLabel)
        view.addSubview(signLabel)
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(faceIDLabel)
        view.addSubview(faceIDSwitch)
        view.addSubview(enterButton)
        view.addSubview(eyeButton)
        view.backgroundColor = .white
    }
    
    @objc func pushBirthdayListAction() {
        let birthdayListVC = BirthdayListViewController()
        birthdayListVC.title = "Birthday"
        self.navigationController?.pushViewController(birthdayListVC, animated: true)
    }
    
   @objc func showPasswordAction() {
        if passwordTextField.isSecureTextEntry {
            eyeButton.setBackgroundImage(UIImage(systemName: "eye.fill"), for: .normal)
            passwordTextField.isSecureTextEntry = false
        } else {
            passwordTextField.isSecureTextEntry = true
            eyeButton.setBackgroundImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        }
    }
}
