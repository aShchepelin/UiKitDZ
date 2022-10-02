//
//  ViewController.swift
//  UiKitDZ
//
//  Created by Александр Андреевич Щепелин on 21.09.2022.
//

import UIKit

// Стартовый экран приложения
final class SrartPageViewController: UIViewController {
    
    // MARK: - Visual Components
    
    private let label: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25)
        label.textColor = .black
        label.sizeToFit()
        label.frame = CGRect(x: 100, y: 200, width: 200, height: 50)
        label.shadowColor = .systemGray
        label.shadowOffset = CGSize(width: 2, height: 2)
        return label
    }()
    
    private lazy var toBarController: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("To TabBar", for: .normal)
        button.layer.cornerRadius = 15
        button.frame = CGRect(x: 230, y: 700, width: 100, height: 40)
        button.addTarget(self, action: #selector(toSecondVCAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var sliderForFont: UISlider = {
        let slider = UISlider()
        slider.frame = CGRect(x: 50, y: 500, width: 300, height: 30)
        slider.minimumValue = 10
        slider.value = 15
        slider.maximumValue = 50
        slider.addTarget(self, action: #selector(sliderValue), for: .valueChanged)
        return slider
    }()
    // MARK: - Public properties
    var colorPicker = UIPickerView()
    var linesPicker = UIPickerView()
    var colors = ["AppRed", "AppGreen", "AppBlue"]
    var lines = [1, 2, 3, 4, 5, 6]
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private methods
    private func setupUI() {
        title = "LabelChangeVC"
        view.backgroundColor = .white
        view.addSubview(label)
        view.addSubview(sliderForFont)
        navigationItem.setRightBarButton(.init(barButtonSystemItem: .add,
                                               target: self,
                                               action: #selector(labelAlert)),
                                         animated: true)
        colorPicker.tag = 1
        linesPicker.tag = 2
        colorPicker.delegate = self
        linesPicker.delegate = self
        colorPicker.dataSource = self
        linesPicker.dataSource = self
        colorPicker.frame = CGRect(x: 30, y: 600, width: 200, height: 50)
        linesPicker.frame = CGRect(x: 30, y: 700, width: 200, height: 50)
        view.addSubview(colorPicker)
        view.addSubview(linesPicker)
        view.addSubview(toBarController)
        
    }
    
    @objc private func sliderValue() {
        self.label.font = UIFont.systemFont(ofSize: CGFloat(sliderForFont.value))
    }
    
    @objc private func labelAlert() {
        let alertController = UIAlertController(title: "Введи слово", message: "", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
        guard let inputText = alertController.textFields?.first?.text else { return }
            self.label.text = inputText
            print(self.label.text ?? "Error")
        }
        alertController.addAction(okAction)
        alertController.addTextField()
        present(alertController, animated: true)
    }
    
    @objc func toSecondVCAction() {
        let secondVC = SecondViewController()
        navigationController?.pushViewController(secondVC, animated: true)
       
    }
}

/// Расширение для пикера

extension SrartPageViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
           return colors.count
        case 2:
           return lines.count
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return colors[row]
        case 2:
            return "\(lines[row])"
        default:
            return "Error"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            label.textColor = UIColor(named: colors[row])
            label.resignFirstResponder()
        case 2:
            label.numberOfLines = lines[row]
            label.resignFirstResponder()
        default:
            return
        }
    }

}
