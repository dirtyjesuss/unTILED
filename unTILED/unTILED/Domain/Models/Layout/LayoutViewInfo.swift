//
//  LayoutViewInfo.swift
//  unTILED
//
//  Created by Ruslan Khanov on 24.04.2022.
//

import Foundation

final class LayoutViewInfo {
    
    // MARK: - Instance properties

    var cells: [Cell] = []
    var inset: Int = .zero
    var size: Fraction
    
    // MARK: - Init
    
    init(size: Fraction) {
        self.size = size
    }
}
