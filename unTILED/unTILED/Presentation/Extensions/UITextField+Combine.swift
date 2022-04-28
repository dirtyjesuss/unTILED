//
//  UITextField+Combine.swift
//  unTILED
//
//  Created by Ruslan Khanov on 28.04.2022.
//

import UIKit
import Combine

extension UITextField {
    var textChangePublisher: AnyPublisher<String, Never> {
        NotificationCenter.default
            .publisher(for: UITextField.textDidChangeNotification, object: self)
            .compactMap { $0.object as? UITextField }
            .map { $0.text ?? "" }
            .eraseToAnyPublisher()
    }
}
