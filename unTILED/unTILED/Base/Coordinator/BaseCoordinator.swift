//
//  BaseCoordinator.swift
//  unTILED
//
//  Created by Ruslan Khanov on 27.04.2022.
//

import Combine
import Foundation.NSUUID
import UIKit.UINavigationController

class BaseCoordinator<CoordinationResult>: Coordinator {
    
    // MARK: - Instance properties

    var id = UUID()

    let navigationController: UINavigationController

    var cancellables = Set<AnyCancellable>()

    private var childCoordinators: [UUID: Any] = [:]
    
    // MARK: - Init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Start
    
    func start() -> AnyPublisher<CoordinationResult, Never> {
        fatalError("Method start() of BaseCoordinator must be overriden")
    }
    
    // MARK: - Coordination
    
    func coordinate<C: Coordinator>(to coordinator: C) -> AnyPublisher<C.Result, Never> {
        addChild(coordinator)

        return coordinator.start()
            .prefix(1)
            .handleEvents(receiveOutput: { _ in
                self.removeChild(coordinator)
            })
            .eraseToAnyPublisher()
    }
    
    // MARK: - Add/remove child
    
    private func addChild<C: Coordinator>(_ coordinator: C) {
        childCoordinators[coordinator.id] = coordinator
    }
    
    private func removeChild<C: Coordinator>(_ coordinator: C) {
        childCoordinators.removeValue(forKey: coordinator.id)
    }
}
