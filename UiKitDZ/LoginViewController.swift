//
//  LoginViewController.swift
//  UiKitDZ
//
//  Created by Александр Андреевич Щепелин on 03.10.2022.
//

import UIKit
/// экран для входа с проверкой на логин в userDefolts
final class LoginViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - Private properties
    private(set) var key = ""
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        key = UserDefaults.standard.string(forKey: "emailTextField") ?? ""
    }
    
    // MARK: - IBActions
    
    @IBAction func interButtonAction(_ sender: Any) {
//        toNewsVC()
        if emailTextField.text == key {
            toNewsVC()
        }
        print("\(key)")
    }
    
    @IBAction func registationButtonAction(_ sender: Any) {
        toRegistationVC()
    }
    
    // MARK: - Private methods
   private func setupUI() {
        title = "Экран входа"
       passwordTextField.delegate = self
       emailTextField.delegate = self
    }
    
    private func toNewsVC() {
        let newsVC = UIStoryboard(name: "Main", bundle: nil)
        guard let nextScreen = newsVC.instantiateViewController(withIdentifier: "NewsViewController")
                as? NewsViewController else { return }
        nextScreen.modalPresentationStyle = .fullScreen
        self.show(nextScreen, sender: nil)
    }
    
    private func toRegistationVC() {
        let newsVC = UIStoryboard(name: "Main", bundle: nil)
        guard let nextScreen = newsVC.instantiateViewController(withIdentifier: "RegistationViewController")
                as? RegistationViewController else { return }
        navigationController?.pushViewController(nextScreen, animated: true)
    }
}
    // MARK: - Extencsions UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case emailTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            passwordTextField.resignFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return false
    }
}
