//
//  AppCoordinator.swift
//  unTILED
//
//  Created by Ruslan Khanov on 27.04.2022.
//

import Combine

final class AppCoordinator: BaseCoordinator<Void> {
    
    // MARK: - Start
    
    override func start() -> AnyPublisher<Void, Never> {
        Just(()).eraseToAnyPublisher()
    }
}
