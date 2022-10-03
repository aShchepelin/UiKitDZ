//
//  LoginViewController.swift
//  UiKitDZ
//
//  Created by Александр Андреевич Щепелин on 03.10.2022.
//

import UIKit
/// экран для входа
final class LoginViewController: UIViewController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - IBActions
    
    @IBAction func interButtonAction(_ sender: Any) {
        toNewsVC()
    }
    
    // MARK: - Private methods
   private func setupUI() {
        title = "Экран входа"
    }
    
    private func toNewsVC() {
        let newsVC = UIStoryboard(name: "Main", bundle: nil)
        guard let nextScreen = newsVC.instantiateViewController(withIdentifier: "NewsViewController")
                as? NewsViewController else { return }
        nextScreen.modalPresentationStyle = .fullScreen
        self.show(nextScreen, sender: nil)
    }
}
