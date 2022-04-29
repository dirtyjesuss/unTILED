//
//  FirebaseAuth+Combine.swift
//  unTILED
//
//  Created by Ruslan Khanov on 29.04.2022.
//

import FirebaseAuth
import Combine

extension FirebaseAuth.Auth {
    
    func signInPublisher(email: String, password: String) -> AnyPublisher<AuthDataResult?, Error> {
        Deferred {
            Future { promise in
                Auth.auth()
                    .signIn(
                    withEmail: email,
                    password: password
                ) { authResult, error in
                    if let error = error {
                        promise(.failure(error))
                    } else {
                        promise(.success(authResult))
                    }
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
