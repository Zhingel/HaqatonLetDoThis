//
//  ProfileViewController.swift
//  HacatonStocksChatApp
//
//  Created by Стас Жингель on 26.11.2021.
//

import Foundation
import UIKit

class AuthorisationViewController: UIViewController {
    
    let loginTextField = HackTextField(placeholder: "Логин")
    let passwordTextField = HackTextField(placeholder: "Пароль")
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configurateView()
    }
    
    func configurateView(){
        
        let stackView = UIStackView()
        //Views
        let authorisationLable = UILabel()

        let enterButton = HackButton(bgColor: .systemMint, title: "Войти")
        //
        
        authorisationLable.text = "Авторизация"
        passwordTextField.textContentType = .password
        passwordTextField.isSecureTextEntry = true
        
        enterButton.addTarget(self, action: #selector(handleSignInButoon), for: .touchUpInside)
        
        view.addSubview(stackView)
        
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 20
        
        stackView.addArrangedSubview(authorisationLable)
        stackView.addArrangedSubview(loginTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(enterButton)
        
        NSLayoutConstraint.activate([
        
            stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
        ])
        
        stackView.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        stackView.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        stackView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        stackView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    @objc func handleSignInButoon(){
        
        let login = loginTextField.text
        let password = passwordTextField.text
        
        //Запрос в БЭК на получение идентификатора
        
        self.navigationController?.pushViewController(ProfileViewController(identifire: "190-jask-wd"), animated: true)
    }
}
