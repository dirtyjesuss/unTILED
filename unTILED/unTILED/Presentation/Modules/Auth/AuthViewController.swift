//
//  AuthViewController.swift
//  unTILED
//
//  Created by Ruslan Khanov on 28.04.2022.
//

import UIKit
import SnapKit
import Combine

class AuthViewController: UIViewController {

    // MARK: - Instance properties
    
    private let viewModel: AuthViewModel
    
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Views
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "email"
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        
        return textField
    }()

    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "password"
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()   
        stack.axis = .vertical
        stack.spacing = 10
        stack.addArrangedSubview(emailTextField)
        stack.addArrangedSubview(passwordTextField)
        
        return stack
    }()
    
    private lazy var signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("sign in", for: .normal)
        button.setTitleColor(.gray, for: .disabled)
        button.setTitleColor(.systemBlue, for: .normal)
        
        return button
    }()
    
    // MARK: - Init
    
    init(viewModel: AuthViewModel) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        nil
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupSubviews()
        setupBindings()
    }
    
    // MARK: - Subviews' setup
    
    private func setupView() {
        view.backgroundColor = .white
    }
    
    private func setupSubviews() {
        view.addSubview(stackView)
        view.addSubview(signInButton)

        emailTextField.snp.makeConstraints { make in
            make.width.equalTo(200)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.width.equalTo(200)
        }
        
        stackView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        signInButton.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(20)
            make.centerX.equalTo(stackView)
        }
    }
    
    // MARK: - Bindings
    
    private func setupBindings() {
        emailTextField.textChangePublisher
            .assign(to: \.email, on: viewModel)
            .store(in: &cancellables)
        
        passwordTextField.textChangePublisher
            .assign(to: \.password, on: viewModel)
            .store(in: &cancellables)
        
        viewModel.$isSignInEnabled
            .assign(to: \.isEnabled, on: signInButton)
            .store(in: &cancellables)
    }
}
