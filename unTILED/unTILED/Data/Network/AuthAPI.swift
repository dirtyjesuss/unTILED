//
//  AuthAPI.swift
//  unTILED
//
//  Created by Ruslan Khanov on 28.04.2022.
//

import Combine
import FirebaseAuth

enum AuthAPI {
    static func signIn(with credentials: UserCredentials) -> AnyPublisher<AuthDataResult?, Error> {
        Auth.auth()
            .signInPublisher(email: credentials.email, password: credentials.password)
            .eraseToAnyPublisher()
    }
}
