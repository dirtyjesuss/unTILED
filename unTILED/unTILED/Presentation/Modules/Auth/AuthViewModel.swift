//
//  AuthViewModel.swift
//  unTILED
//
//  Created by Ruslan Khanov on 28.04.2022.
//

import Combine
import Foundation

final class AuthViewModel: ObservableObject {
    
    // MARK: - Published properties
    
    @Published var email = ""
    @Published var password = ""
    @Published var isSignInEnabled = false
    
    // MARK: - Publishers
    
    private var isSignInEnabledPublisher: AnyPublisher<Bool, Never> {
        Publishers
            .CombineLatest($email, $password)
            .map { email, password in
                !email.isEmpty && !password.isEmpty
            }
            .eraseToAnyPublisher()
    }
    
    var logInPublisher: AnyPublisher<Void, Never> {
        logInSubject.eraseToAnyPublisher()
    }

    private let logInSubject = PassthroughSubject<Void, Never>()

    // MARK: - Private properties
    
    private var cancellables: Set<AnyCancellable> = []
    
    // MARK: - Init
    
    init() {
        isSignInEnabledPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.isSignInEnabled, on: self)
            .store(in: &cancellables)
    }
}
