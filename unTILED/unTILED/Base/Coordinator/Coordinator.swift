//
//  Coordinator.swift
//  unTILED
//
//  Created by Ruslan Khanov on 27.04.2022.
//

import Combine
import Foundation.NSUUID

protocol Coordinator: AnyObject {
    associatedtype Result

    var id: UUID { get }
    
    func start() -> AnyPublisher<Result, Never>
}
