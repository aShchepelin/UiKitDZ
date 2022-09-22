//
//  Model.swift
//  UiKitDZ
//
//  Created by Александр Андреевич Щепелин on 22.09.2022.
//

import Foundation
/// Модель для обработки текста
struct WordProcessing {
     func decodeString(text: String) -> String {
        if text == "leohl" {
            return "hello"
        } else {
            return "error"
        }
    }
}
