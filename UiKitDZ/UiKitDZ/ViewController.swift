//
//  ViewController.swift
//  UiKitDZ
//
//  Created by Александр Андреевич Щепелин on 21.09.2022.
//

import UIKit
/// Переход на следующий экран + кнопка делающая пароль видимым
class ViewController: UIViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func enterButton(_ sender: Any) {
        let secondVC = UIStoryboard(name: "Main", bundle: nil)
        guard let nextScreen = secondVC.instantiateViewController(withIdentifier: "SecondScreenController")
                as? SecondScreenController else { return }
        nextScreen.modalPresentationStyle = .fullScreen
        self.show(nextScreen, sender: nil)
    }
    
    @IBAction func eyeButton(_ sender: Any) {
        if passwordTextField.isSecureTextEntry {
            passwordTextField.isSecureTextEntry = false
        } else {
            passwordTextField.isSecureTextEntry = true
        }
    }
    
}
