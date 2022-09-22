//
//  ViewController.swift
//  UiKitDZ
//
//  Created by Александр Андреевич Щепелин on 21.09.2022.
//

import UIKit
/// Отрисовка алерта
class ViewController: UIViewController {
    let textLabel: UILabel = {
       var label = UILabel()
        label.frame = CGRect(x: 120, y: 200, width: 70, height: 70)
        return label
    }()
    let startButton: UIButton = {
       let button = UIButton()
        button.frame = CGRect(x: 120, y: 100, width: 150, height: 70)
        button.setTitle("Начать", for: .normal)
        button.backgroundColor = .orange
        return button
    }()
    var model = WordProcessing()
    var text = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        startButton.addTarget(self, action: #selector(startGame), for: .touchUpInside)
    }
    func setupUI() {
        view.addSubview(startButton)
        view.addSubview(textLabel)
    }
    
    @objc func startGame() {
        helloGame()
    }
    func helloGame() {
        let alertController = UIAlertController(title: "", message: "Введите слово", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default) { _ in
            guard let text = alertController.textFields?.first?.text else { return }
            self.textLabel.text = self.model.decodeString(text: text)
        }
        
        alertController.addAction(action)
        alertController.addTextField()
        self.present(alertController, animated: true)
    }
   
}
