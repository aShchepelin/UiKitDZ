//
//  ViewController.swift
//  UiKitDZ
//
//  Created by Александр Андреевич Щепелин on 21.09.2022.
//

import UIKit

final class ViewController: UIViewController {
    var game = Game()
    var summ = Int()

    let resultLabel: UILabel = {
        let result = UILabel()
        result.frame = CGRect(x: 200, y: 140, width: 70, height: 70)
        return result
    }()
    
    let randomLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 100, y: 240, width: 200, height: 70)
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 100, y: 340, width: 200, height: 70)
        return label
    }()
    
    let summButton: UIButton = {
        let button = UIButton()
        button.setTitle("Сложение", for: .normal)
        button.backgroundColor = .orange
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
        return button
    }()
    
    let randomButton: UIButton = {
        let button = UIButton()
        button.setTitle("Угадай число", for: .normal)
        button.backgroundColor = .orange
        button.frame = CGRect(x: 100, y: 200, width: 200, height: 50)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        summButton.addTarget(self, action: #selector(summGame), for: .touchUpInside)
        resultLabel.text = String(summ)
        randomButton.addTarget(self, action: #selector(randomGame), for: .touchUpInside)
        setupUI()
        }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        nameAlert()
    }
    @objc func randomGame() {
        showAlert()
    }
    @objc func summGame() {
        summAlert()
    }
    func setupUI() {
        view.addSubview(summButton)
        view.addSubview(resultLabel)
        view.addSubview(randomButton)
        view.addSubview(randomLabel)
        view.addSubview(nameLabel)
    }

     func summAlert() {
         let alertController = UIAlertController(title: "Сложение", message: "Введите числа", preferredStyle: .alert)
         let action = UIAlertAction(title: "Ок", style: .default) { _ in
             guard let firstNumber = alertController.textFields?.first?.text else { return }
             guard let secondNumber = alertController.textFields?[1].text else { return }
             self.summ = (Int(secondNumber) ?? 0) + (Int(firstNumber) ?? 0)
             self.resultLabel.text = String(self.summ)
}
         alertController.addTextField()
         alertController.addTextField()
         alertController.addAction(action)
         self.present(alertController, animated: true)
       
     }
    
    func nameAlert() {
        let alertController = UIAlertController(title: "Привет!", message: "Введите имя", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default) { _ in
            guard let fullName = alertController.textFields?.first?.text else { return }
            self.nameLabel.text = "Привет \(fullName)!"
        }
        alertController.addTextField()
        alertController.addAction(action)
        self.present(alertController, animated: true)
    }
   
}

extension ViewController {
    func showAlert() {
        let alertController = UIAlertController(title: "Угадай число", message: "Введите число", preferredStyle: .alert)
        
        alertController.addTextField { textField in
            textField.delegate = self
        }
        
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alertController.addAction(okAction)
        
        alertController.preferredAction = okAction
        
        present(alertController, animated: true) {
            self.game.generate()
        }
        
        if game.number == game.random {
            self.randomLabel.text = "Ты угадал"
        } else {
            self.randomLabel.text = "Ты не угадал"
        }
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = textField.text, let number = Int(text) {
            game.random = number
        }
    }
}

///  Game
class Game {
    var number: Int
    var random: Int
        init() {
        number = 0
        random = 0
    }
    func generate() {
        random = Int.random(in: 1...10)
    }
    
    func correctNumb(random: Int) -> Bool {
        number == random
    }
}
