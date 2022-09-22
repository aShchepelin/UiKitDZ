//
//  SecondScreenController.swift
//  UiKitDZ
//
//  Created by Александр Андреевич Щепелин on 22.09.2022.
//

import UIKit
/// Вызов алерта для перехода на следующий экран
class SecondScreenController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func checkButton(_ sender: Any) {
        let alertControll = UIAlertController(title: "Выставить чек?", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default) { _ in
            let thirdVC = UIStoryboard(name: "Main", bundle: nil)
            guard let nextScreen = thirdVC.instantiateViewController(withIdentifier: "ThirdViewController")
                    as? ThirdViewController else { return }
            nextScreen.modalPresentationStyle = .fullScreen
            self.show(nextScreen, sender: nil)
        }
        let cancelAction = UIAlertAction(title: "Closed", style: .cancel)
        alertControll.addAction(action)
        alertControll.addAction(cancelAction)
        present(alertControll, animated: true)
    }
}
