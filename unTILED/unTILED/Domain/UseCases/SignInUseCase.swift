//
//  SignInUseCase.swift
//  unTILED
//
//  Created by Ruslan Khanov on 29.04.2022.
//

import Combine

protocol SignInUseCase: AnyObject {
    func signIn(with: UserCredentials) -> AnyPublisher<Void, Never>
}

final class SignInUseCaseImp: SignInUseCase {

    func signIn(with: UserCredentials) -> AnyPublisher<Void, Never> {
        fatalError()
    }
}
