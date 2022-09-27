//
//  ShareVC.swift
//  UiKitDZ
//
//  Created by Александр Андреевич Щепелин on 27.09.2022.
//

import Foundation
import UIKit
/// Вызов UIActivity через кнопку с возможностью зашерить или распечатать картинку, и такой же функционал на пикере при вызове третьего элемента
class ShareViewController: UIViewController {
    
    @IBOutlet weak var pickerField: UITextField!
    
    var countries = ["USA", "Russia", "China"]
    
    var countriesPicker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        
        countriesPicker.delegate = self
        countriesPicker.dataSource = self
        pickerField.inputView = countriesPicker
    }
    
    @IBAction func shareButton(_ sender: Any) {
        presentShareSheetAction()
    }
    
    @objc func presentShareSheetAction() {
        guard let image = UIImage(systemName: "cloud.fill"),
              let url = URL(string: "https://www.facebook.com") else { return }
        let shareSheetVC = UIActivityViewController(activityItems: [image, url], applicationActivities: nil)
        present(shareSheetVC, animated: true)
    }
}

extension ShareViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        countries.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countries[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerField.text = countries[row]
        pickerField.resignFirstResponder()
        guard pickerField.text == "China" else { return }
        presentShareSheetAction()
    }
    
}
