//
//  Model.swift
//  UiKitDZ
//
//  Created by Александр Андреевич Щепелин on 22.09.2022.
//

import Foundation
import UIKit

extension ViewController {
    func helloGame() {
        let alertController = UIAlertController(title: "", message: "Введите слово", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default) { _ in
            guard let firstTextField = alertController.textFields?.first?.text else { return }
            if firstTextField == "leohl" {
                self.textLabel.text = "Hello"
            }
        }
        
        alertController.addAction(action)
        alertController.addTextField()
        self.present(alertController, animated: true)
    }
    }
