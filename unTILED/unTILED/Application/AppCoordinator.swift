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
        // TODO: Check authorization
        if true {
            startAuthFlow()
        } else {
            startMainFlow()
        }
        
        return Empty(completeImmediately: false)
            .eraseToAnyPublisher()
    }
    
    // MARK: - Flows
    
    private func startAuthFlow() {
        let authCoordinator = AuthCoordinator(navigationController: navigationController)

        coordinate(to: authCoordinator)
            .sink { [unowned self] _ in
                self.startMainFlow()
            }
            .store(in: &cancellables)
    }
    
    private func startMainFlow() {
        
    }
}
