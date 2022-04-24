//
//  Fraction.swift
//  unTILED
//
//  Created by Ruslan Khanov on 24.04.2022.
//

struct Fraction {
    let numerator: UInt
    let denominator: UInt
    
    init(numerator: UInt, denominator: UInt) {
        guard denominator != 0 else {
            fatalError("Denominator cannot be zero.")
        }

        self.numerator = numerator
        self.denominator = denominator
    }
}
