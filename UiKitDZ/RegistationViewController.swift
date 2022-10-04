//
//  ViewController.swift
//  UiKitDZ
//
//  Created by Александр Андреевич Щепелин on 21.09.2022.
//

import UIKit

/// Экран для регистрации с реализованным пропаданием клавы и добавлением данных в UserDefolts
final class RegistationViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    // MARK: - Private properties
    
    private let defaults = UserDefaults.standard
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    // MARK: - IBActions
    @IBAction func enterButtonAction(_ sender: Any) {
        let username = emailTextField.text ?? ""
        if !username.isEmpty {
            UserDefaults.standard.set(username, forKey: "emailTextField")
        }
        navigationController?.popViewController(animated: true)
    }
    // MARK: - Private methods
    private func setupUI() {
        view.backgroundColor = .white
        setupKeyboardHiding()
        emailTextField.delegate = self
        nameTextField.delegate = self
        passwordTextField.delegate = self
        defaults.string(forKey: "emailTextField")
    }
    
    private func setupKeyboardHiding() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShowAction),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHideAction),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    @objc private func keyboardWillShowAction(sender: NSNotification) {
        view.frame.origin.y = -200
    }
    
    @objc private func keyboardWillHideAction(sender: NSNotification) {
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
    // MARK: - Extencsions UITextFieldDelegate
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
