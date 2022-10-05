//
//  ViewController.swift
//  UiKitDZ
//
//  Created by Александр Андреевич Щепелин on 21.09.2022.
//

import UIKit

/// Экран с текствью фичами по шрифту и т.д
final class ReaderViewController: UIViewController {
    // MARK: - Enum
    private enum Constants {
        static let textForReader = """
Земную жизнь пройдя до половины,
Я очутился в сумрачном лесу,
Утратив правый путь во тьме долины
Каков он был, о, как произнесу,
Тот дикий лес, дремучий и грозящий,
Чей давний ужас в памяти несу!

Так горек он, что смерть едва ль не слаще.
Но, благо в нем обретши навсегда,
Скажу про все, что видел в этой чаще.

Не помню сам, как я вошел туда,
Настолько сон меня опутал ложью,
Когда я сбился с верного следа.
"""
        static let themeLabelText = "Light/Dark theme"
    }
    
    // MARK: - Visual Components
    
    private lazy var fontSlider: UISlider = {
        let slider = UISlider()
        slider.frame = CGRect(x: 50, y: 600, width: 200, height: 30)
        slider.minimumValue = 10
        slider.value = 15
        slider.maximumValue = 50
        slider.addTarget(self, action: #selector(sliderValueAction), for: .valueChanged)
        return slider
    }()
    
    private lazy var redColorButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.layer.cornerRadius = 15
        button.frame = CGRect(x: 50, y: 650, width: 30, height: 30)
        button.addTarget(self, action: #selector(redFontAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var blueColorButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.layer.cornerRadius = 15
        button.frame = CGRect(x: 100, y: 650, width: 30, height: 30)
        button.addTarget(self, action: #selector(blueFontAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var greenColorButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        button.layer.cornerRadius = 15
        button.frame = CGRect(x: 150, y: 650, width: 30, height: 30)
        button.addTarget(self, action: #selector(greenFontAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var orangeColorButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .orange
        button.layer.cornerRadius = 15
        button.frame = CGRect(x: 200, y: 650, width: 30, height: 30)
        button.addTarget(self, action: #selector(orangeFontAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var smallFontButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "textformat.size.smaller"), for: .normal)
        button.tintColor = .gray
        button.frame = CGRect(x: 30, y: 705, width: 15, height: 15)
        button.addTarget(self, action: #selector(smallFontAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var largeFontButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "textformat.size.larger"), for: .normal)
        button.tintColor = .gray
        button.frame = CGRect(x: 50, y: 700, width: 20, height: 20)
        button.addTarget(self, action: #selector(largeFontAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var themeSwitch: UISwitch = {
        let toggle = UISwitch()
        toggle.frame = CGRect(x: 320, y: 700, width: 30, height: 30)
        toggle.addTarget(self, action: #selector(darkThemeAction), for: .valueChanged)
        return toggle
    }()
    
    private lazy var toggleLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.themeLabelText
        label.frame = CGRect(x: 180, y: 700, width: 150, height: 30)
        return label
    }()
    
    // MARK: - Private properties
    private var myTextView = UITextView()
    private var fonts = ["Verdana", "Geeza Pro Regular", "Hoefler Text Italic", "Times New Roman"]
    private var fontsPicker = UIPickerView()
    private var myCurrentFont = ""
    let theme = Theme(textColor: .black, backgroundColor: .white)
    
    // MARK: - Lifevycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private methods
    private func setupUI() {
        view.backgroundColor = .white
        fontsPicker.delegate = self
        fontsPicker.dataSource = self
        myTextView = UITextView(frame: CGRect(x: 20,
                                              y: 100,
                                              width: view.bounds.width - 40,
                                              height: view.bounds.height / 2))
        myTextView.text = Constants.textForReader
        myTextView.textColor = .black
        view.addSubview(myTextView)
        view.addSubview(fontSlider)
        view.addSubview(redColorButton)
        view.addSubview(blueColorButton)
        view.addSubview(greenColorButton)
        view.addSubview(orangeColorButton)
        view.addSubview(smallFontButton)
        view.addSubview(largeFontButton)
        fontsPicker.frame = CGRect(x: 20, y: 750, width: 300, height: 50)
        view.addSubview(fontsPicker)
        view.addSubview(themeSwitch)
        view.addSubview(toggleLabel)
        myTextView.isSelectable = false
        fontsPicker.setValue(UIColor.gray, forKey: "textColor")
    }
    
    @objc private func sliderValueAction() {
        myTextView.font = UIFont.systemFont(ofSize: CGFloat(fontSlider.value))
    }
    
    @objc private func redFontAction() {
        myTextView.textColor = .red
    }
    
    @objc private func blueFontAction() {
        myTextView.textColor = .blue
    }
    
    @objc private func greenFontAction() {
        myTextView.textColor = .green
    }
    
    @objc private func orangeFontAction() {
        myTextView.textColor = .orange
    }
    
    @objc private func smallFontAction() {
        myTextView.font = UIFont(name: myCurrentFont, size: CGFloat(fontSlider.value))
    }
    
    @objc private func largeFontAction() {
        myTextView.font = UIFont(name: myCurrentFont, size: CGFloat(fontSlider.value))?.bold
    }
    
    @objc private func darkThemeAction(_ toggle: UISwitch) {
        let currentTheme = toggle.isOn ? Theme.dark : Theme.light
        
        view.backgroundColor = currentTheme.backgroundColor
        myTextView.textColor = currentTheme.textColor
        myTextView.backgroundColor = currentTheme.backgroundColor
        toggleLabel.textColor = currentTheme.textColor
        fontsPicker.tintColor = currentTheme.textColor
        fontsPicker.backgroundColor = currentTheme.backgroundColor
        smallFontButton.tintColor = currentTheme.textColor
        largeFontButton.tintColor = currentTheme.textColor
    }
}

// MARK: - Exstension UIPickerViewDelegate, UIPickerViewDataSource
extension ReaderViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        fonts.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        fonts[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        myTextView.font = UIFont(name: fonts[row], size: CGFloat(fontSlider.value))
        myTextView.resignFirstResponder()
        myCurrentFont = fonts[row]
    }
}
