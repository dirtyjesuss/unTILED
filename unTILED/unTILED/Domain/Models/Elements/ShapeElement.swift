//
//  ShapeElement.swift
//  unTILED
//
//  Created by Ruslan Khanov on 24.04.2022.
//

protocol ShapeElement: CellElement {
    var fillColor: RGBA { get }
    var stroke: Stroke { get }
    var contentAlignment: ContentAlignment { get }
}

struct CircleElement: ShapeElement {
    var fillColor: RGBA
    var stroke: Stroke
    var contentAlignment: ContentAlignment

    var radius: Float
}

struct RectElement: ShapeElement {
    var fillColor: RGBA
    var stroke: Stroke
    var contentAlignment: ContentAlignment

    var width: Fraction
    var height: Fraction
    var cornerRadius: Float
}
