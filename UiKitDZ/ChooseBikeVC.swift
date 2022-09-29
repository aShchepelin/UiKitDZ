//
//  ChooseBikeVC.swift
//  UiKitDZ
//
//  Created by Александр Андреевич Щепелин on 26.09.2022.
//

import Foundation
import UIKit
/// Экран для выбора велосипеда к покупке
class ChooseBikeViewController: UIViewController {
    
    let sizeTextField: UITextField = {
       let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Size bike"
        textField.frame = CGRect(x: 65, y: 200, width: 250, height: 30)
        return textField
    }()
    
    let discountValueLabel: UILabel = {
       let label = UILabel()
        label.frame = CGRect(x: 330, y: 110, width: 50, height: 30)
        return label
    }()
    
    let discountLabel: UILabel = {
        let label = UILabel()
        label.text = "Discount %"
        label.frame = CGRect(x: 230, y: 110, width: 100, height: 30)
        return label
    }()
    
    let color = UISlider(frame: CGRect(x: 10, y: 100, width: 200, height: 50))
    
    var bikeType = ""
    
    lazy var buyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add to basket", for: .normal)
        button.backgroundColor = .systemBlue
        button.frame = CGRect(x: 90, y: 700, width: 200, height: 50)
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(pushBasketVCAction), for: .touchUpInside)
       return button
    }()
    
    let bikes = [UIImage(named: "marin.jpg"),
                 UIImage(named: "brooklyn.jpg"),
                 UIImage(named: "trek.jpeg")]
    
    let sizes = ["S", "M", "L", "XL"]
    let sizePicker = UIPickerView()
    
    var segmentControll = UISegmentedControl()
    var menu = ["Road race bike", "City bike", "Mountain bike"]
    var imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(buyButton)
        imageView.frame = CGRect(x: 0, y: 0, width: 350, height: 250)
        imageView.center = view.center
        imageView.image = bikes[0]
        view.addSubview(imageView)
        sizePicker.delegate = self
        segmentControll = UISegmentedControl(items: self.menu)
        segmentControll.frame = CGRect(x: 22, y: 600, width: 350, height: 30)
        view.addSubview(segmentControll)
        segmentControll.addTarget(self, action: #selector(selectedBikeAction(target:)), for: .valueChanged)
        view.addSubview(sizeTextField)
        sizeTextField.inputView = sizePicker
        color.minimumValue = 1
        color.maximumValue = 5
        color.value = 3
        view.addSubview(color)
        view.addSubview(discountValueLabel)
        color.addTarget(self, action: #selector(colorValue(sender:)), for: .valueChanged)
        view.addSubview(discountLabel)
        imageView.contentMode = .scaleAspectFill
    }
    
    @objc func colorValue(sender: UISlider) {
        discountValueLabel.text = "\(Int(color.value))"
    }
    
    @objc func selectedBikeAction(target: UISegmentedControl) {
        if target == segmentControll {
            let segmentIndex = target.selectedSegmentIndex
            imageView.image = bikes[segmentIndex]
            bikeType = target.titleForSegment(at: segmentIndex) ?? ""
            
        }
    }
    
    @objc func pushBasketVCAction() {
        let attention = UIAlertController(title: "Are you shure?", message: "", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Yes", style: .default) { [weak self] _  in
            guard let self = self else { return }
            let basketVC = BasketViewController()
            basketVC.title = "Shop Basket"
            basketVC.bikeInfo = self.bikeType
            self.navigationController?.pushViewController(basketVC, animated: true)
        }
        let noAction = UIAlertAction(title: "No", style: .cancel)
        attention.addAction(okAction)
        attention.addAction(noAction)
        present(attention, animated: true)
        }
}

extension ChooseBikeViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sizes.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return sizes[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        sizeTextField.text = sizes[row]
        sizeTextField.resignFirstResponder()
    }
}
