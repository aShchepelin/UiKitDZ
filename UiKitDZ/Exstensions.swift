//
//  Exstensions.swift
//  UiKitDZ
//
//  Created by Александр Андреевич Щепелин on 05.10.2022.
//

import UIKit
// MARK: - Exstension UIFont
/// файл с общим расширением шрифта
extension UIFont {
    var bold: UIFont { return withWeight(.bold) }
    var semibold: UIFont { return withWeight(.semibold) }

    private func withWeight(_ weight: UIFont.Weight) -> UIFont {
        var attributes = fontDescriptor.fontAttributes
        var traits = (attributes[.traits] as? [UIFontDescriptor.TraitKey: Any]) ?? [:]

        traits[.weight] = weight

        attributes[.name] = nil
        attributes[.traits] = traits
        attributes[.family] = familyName

        let descriptor = UIFontDescriptor(fontAttributes: attributes)

        return UIFont(descriptor: descriptor, size: pointSize)
    }
}
