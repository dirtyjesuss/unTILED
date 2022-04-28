//
//  AuthCoordinator.swift
//  unTILED
//
//  Created by Ruslan Khanov on 28.04.2022.
//

import Combine
import UIKit

final class AuthCoordinator: BaseCoordinator<Void> {

    override func start() -> AnyPublisher<Void, Never> {
        let viewModel = AuthViewModel()
        let viewController = AuthViewController(viewModel: viewModel)

        navigationController.pushViewController(viewController, animated: true)

        return viewModel.logInPublisher
    }
}
