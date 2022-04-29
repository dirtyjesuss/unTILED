//
//  AuthRepository.swift
//  unTILED
//
//  Created by Ruslan Khanov on 29.04.2022.
//

import Combine

enum AuthError: Error {
    case smthGetsWrong
}

protocol AuthRepository: AnyObject {
    func signIn(with credentials: UserCredentials) -> AnyPublisher<Void, AuthError>
}

final class AuthRepositoryImp: AuthRepository {

    func signIn(with credentials: UserCredentials) -> AnyPublisher<Void, AuthError> {
        AuthAPI.signIn(with: credentials)
            .map { _ in ()}
            .mapError { _ in AuthError.smthGetsWrong }
            .eraseToAnyPublisher()
    }
}
