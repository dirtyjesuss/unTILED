//
//  RGBA.swift
//  unTILED
//
//  Created by Ruslan Khanov on 24.04.2022.
//

struct RGBA {
    
    // MARK: - Constants
    
    private enum Constants {
        static let colorMax: Int = 255
        static let alphaMax: Float = 1.0
    }
    
    // MARK: - Fields

    let red: UInt8
    let green: UInt8
    let blue: UInt8
    let alpha: Float
    
    // MARK: - Init
    
    init(red: Int, green: Int, blue: Int, alpha: Float) {
        self.red = red < Constants.colorMax ? UInt8(red) : UInt8(Constants.colorMax)
        self.green = green < Constants.colorMax ? UInt8(green) : UInt8(Constants.colorMax)
        self.blue = blue < Constants.colorMax ? UInt8(blue) : UInt8(Constants.colorMax)
        self.alpha = alpha < Constants.alphaMax ? alpha : Constants.alphaMax
    }
}

// MARK: - Predefined colors

extension RGBA {

    static var white: RGBA {
        RGBA(
            red: Constants.colorMax,
            green: Constants.colorMax,
            blue: Constants.colorMax,
            alpha: Constants.alphaMax
        )
    }
    
    static var black: RGBA {
        RGBA(red: .zero, green: .zero, blue: .zero, alpha: .zero)
    }
}
