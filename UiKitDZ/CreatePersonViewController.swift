//
//  AddPerson.swift
//  UiKitDZ
//
//  Created by Александр Андреевич Щепелин on 24.09.2022.
//

import UIKit
/// Экран добавления человека с пикерами и навигационными кнопками
class CreatePersonViewController: UIViewController {
    
    let personImage: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "person.circle.fill"), for: .normal)
        button.tintColor = .systemGray
        button.frame = CGRect(x: 130, y: 100, width: 150, height: 150)
        return button
    }()
    
    let changePhotoLabel: UILabel = {
        let label = UILabel()
        label.text = "Изменить фото"
        label.textColor = .systemBlue
        label.frame = CGRect(x: 140, y: 250, width: 150, height: 20)
       return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Имя"
        label.textColor = .systemBlue
        label.frame = CGRect(x: 30, y: 300, width: 70, height: 20)
        return label
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите имя"
        textField.frame = CGRect(x: 30, y: 325, width: 250, height: 25)
        return textField
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Дата"
        label.textColor = .systemBlue
        label.frame = CGRect(x: 30, y: 370, width: 70, height: 20)
        return label
    }()
    
    let dateTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите дату"
        textField.frame = CGRect(x: 30, y: 395, width: 250, height: 25)
        return textField
    }()
    
    let ageLabel: UILabel = {
        let label = UILabel()
        label.text = "Возраст"
        label.textColor = .systemBlue
        label.frame = CGRect(x: 30, y: 440, width: 70, height: 20)
        return label
    }()
    
    let ageTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Добавить"
        textField.frame = CGRect(x: 30, y: 465, width: 250, height: 25)
        return textField
    }()
    
    let genderLabel: UILabel = {
        let label = UILabel()
        label.text = "Пол"
        label.textColor = .systemBlue
        label.frame = CGRect(x: 30, y: 510, width: 70, height: 20)
        return label
    }()
    
    let genderTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Добавить"
        textField.frame = CGRect(x: 30, y: 535, width: 250, height: 25)
        return textField
    }()
    
    let instagramLabel: UILabel = {
        let label = UILabel()
        label.text = "Instagram"
        label.textColor = .systemBlue
        label.frame = CGRect(x: 30, y: 580, width: 100, height: 20)
        return label
    }()
    
    let instagramTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Добавить"
        textField.frame = CGRect(x: 30, y: 605, width: 250, height: 25)
        return textField
    }()
    
    let datePicker = UIDatePicker()
    let ages = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]
    let pickerView = UIPickerView()
    let pickerGender = UIPickerView()
    let genders = ["Мужчина", "Женщина", "Боевой вертолет"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        createDatePicker()
        view.backgroundColor = .white
        view.addSubview(personImage)
        view.addSubview(changePhotoLabel)
        view.addSubview(nameLabel)
        view.addSubview(nameTextField)
        view.addSubview(dateLabel)
        view.addSubview(dateTextField)
        view.addSubview(ageLabel)
        view.addSubview(ageTextField)
        view.addSubview(genderLabel)
        view.addSubview(genderTextField)
        view.addSubview(instagramLabel)
        view.addSubview(instagramTextField)
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerGender.delegate = self
        pickerGender.dataSource = self
        instagramTextField.delegate = self
        ageTextField.inputView = pickerView
        genderTextField.inputView = pickerGender
        pickerView.tag = 1
        pickerGender.tag = 2
        rightBarButtonAction()
        leftBarButtonAction()
    }
    
    func rightBarButtonAction() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Добавить",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(pushBirthdayListAction))
        
    }
    
    func leftBarButtonAction() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Отмена",
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(pushBirthdayListAction))
    }
    
    func createDatePicker() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressedAction))
        toolBar.setItems([doneBtn], animated: true)
        dateTextField.inputAccessoryView = toolBar
        dateTextField.inputView = datePicker
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
    }
    
    @objc func pushBirthdayListAction() {
        let addPerson = BirthdayListViewController()
        self.navigationController?.pushViewController(addPerson, animated: true)
    }
    
    @objc func donePressedAction() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        dateTextField.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
}

extension CreatePersonViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return ages.count
        case 2:
            return genders.count
        default:
            return 414
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return "\(ages[row])"
        case 2:
            return genders[row]
        default:
            return "ERROR"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            ageTextField.text = "\(ages[row])"
            ageTextField.resignFirstResponder()
        case 2:
            genderTextField.text = genders[row]
            genderTextField.resignFirstResponder()
        default:
            return
        }
    }
}

extension CreatePersonViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        let alert = UIAlertController(title: "", message: "Введите инстаграм", preferredStyle: .alert)
        let alertCheckButton = UIAlertAction(title: "OK", style: .default) { _ in
            guard let text = alert.textFields?.first?.text else {
                return
            }
            self.instagramTextField.text = text
        }

        alert.addAction(alertCheckButton)
        alert.addTextField()
        
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        
        self.present(alert, animated: true)
        
        return true
    }
}
