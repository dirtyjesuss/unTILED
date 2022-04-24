//
//  TextElement.swift
//  unTILED
//
//  Created by Ruslan Khanov on 24.04.2022.
//

struct TextElement: CellElement {
    
    // MARK: - Nested types

    enum Alignment {
        case left, right, center, justify
    }

    // MARK: - Fields
    
    var content: String
    var textColor: RGBA
    var alignment: Alignment
    var font: String
    var fontSize: Int
}
