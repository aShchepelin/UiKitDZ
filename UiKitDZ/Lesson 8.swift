//
//  ViewController.swift
//  UiKitDZ
//
//  Created by Александр Андреевич Щепелин on 21.09.2022.
//

import UIKit
/// Здесь повторяю урок с ютуба
class ViewController: UIViewController, UITextFieldDelegate {
    
    lazy var shareButton: UIButton = {
       let button = UIButton()
        return button
    }()
    
    let text: UITextField = {
        let text = UITextField()
        return text
    }()
    
    var activityViewController: UIActivityViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        createButton()
        createTextField()
        // Do any additional setup after loading the view.
    }
    
// MARK: - Method
    func createTextField() {
        text.frame = CGRect(x: 0, y: 0, width: 280, height: 30)
        text.center = view.center
        text.borderStyle = .roundedRect
        text.placeholder = "Enter text to share"
        text.delegate = self
        view.addSubview(text)
    }
    
    func createButton() {
        shareButton = UIButton(type: .roundedRect)
        shareButton.frame = CGRect(x: 50, y: 350, width: 280, height: 44)
        shareButton.setTitle("Расшарить", for: .normal)
        shareButton.addTarget(self, action: #selector(handleShare(paramSender:)), for: .touchUpInside)
        view.addSubview(shareButton)
    }
    
    @objc func handleShare(paramSender: Any) {
        let text = text.text
        
        if text?.count == 0 {
            let massage = "Сначала введите текст потом нажмите кнопку"
            let alertController = UIAlertController(title: nil, message: massage, preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .cancel)
            alertController.addAction(action)
            self.present(alertController, animated: true)
        }
        activityViewController = UIActivityViewController(activityItems: [text ?? "nil"],
                                                          applicationActivities: nil)
        guard let activity = activityViewController else { return }
        present(activity, animated: true)
    }
    
    // MARK: - UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        text.resignFirstResponder()
        return true
    }
}
