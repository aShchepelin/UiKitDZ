//
//  TimerViewController.swift
//  UiKitDZ
//
//  Created by Александр Андреевич Щепелин on 01.10.2022.
//

import UIKit
/// Экран таймера с добавлением секунд
final class TimerViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var timer: UIPickerView!
    
    // MARK: - Public properties
    
   private var hours = 0
   private var minutes = 0
   private var seconds = 0
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
   private func setupUI() {
        timer.delegate = self
        timer.dataSource = self
    }
}

/// Расширение пикервью для добавления значений
// MARK: - Extensions
extension TimerViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return 25
        case 1, 2:
            return 60
            
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return pickerView.frame.size.width / 3
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return "\(row) ч"
        case 1:
            return "\(row) мин"
        case 2:
            return "\(row) с"
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            hours = row
        case 1:
            minutes = row
        case 2:
            seconds = row
        default:
            break
        }
    }
}
