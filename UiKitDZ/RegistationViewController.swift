//
//  ViewController.swift
//  UiKitDZ
//
//  Created by Александр Андреевич Щепелин on 21.09.2022.
//

import UIKit

/// Экран для регистрации в с захардкоженным имейлом на проверку и алертом
final class RegistationViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
   
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    // MARK: - IBActions
    
    @IBAction func enterButtonAction(_ sender: Any) {
        if emailTextField.text == "Aleksandr" {
            emailCheck()
        } else {
            let newsVC = UIStoryboard(name: "Main", bundle: nil)
            guard let nextScreen = newsVC.instantiateViewController(withIdentifier: "NewsViewController")
                                 as? NewsViewController else { return }
                         nextScreen.modalPresentationStyle = .fullScreen
                         self.show(nextScreen, sender: nil)
        }
    }
    
    // MARK: - Private methods
    private func setupUI() {
        view.backgroundColor = .white
        setupKeyboardHiding()
        emailTextField.delegate = self
        nameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    private func setupKeyboardHiding() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    @objc private func keyboardWillShow(sender: NSNotification) {
        view.frame.origin.y = -200
    }
    
    @objc private func keyboardWillHide(sender: NSNotification) {
        view.frame.origin.y = 0
    }
    
    private func emailCheck() {
        let attention = UIAlertController(title: "Пользователь с таким имейлом уже есть",
                                          message: "Хотите зайти?",
                                          preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Да", style: .default) { _ in
            let loginVC = UIStoryboard(name: "Main", bundle: nil)
            guard let nextScreen = loginVC.instantiateViewController(withIdentifier: "LoginViewController")
                                 as? LoginViewController else { return }
            nextScreen.modalPresentationStyle = .fullScreen
                         self.show(nextScreen, sender: nil)
        }
        let noAction = UIAlertAction(title: "Нет", style: .cancel)
        attention.addAction(okAction)
        attention.addAction(noAction)
        present(attention, animated: true)
    }
}
    // MARK: - Extencsions
/// Расширение для перехода на следующий текстфилд и на последнем закрыть.
extension RegistationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case emailTextField:
            nameTextField.becomeFirstResponder()
        case nameTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            passwordTextField.resignFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return false
        }
}
