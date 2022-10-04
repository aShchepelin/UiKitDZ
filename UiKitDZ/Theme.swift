//
//  Theme.swift
//  UiKitDZ
//
//  Created by Александр Андреевич Щепелин on 04.10.2022.
//

import UIKit
// MARK: - Structure
/// Структура для светлой/темной темы
struct Theme {
    let textColor: UIColor
    let backgroundColor: UIColor
    
    static let light = Theme(textColor: .black, backgroundColor: .white)
    static let dark = Theme(textColor: .white, backgroundColor: .black)
}
