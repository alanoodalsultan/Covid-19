//
//  WelcomeScreen.swift
//  Covid-19-
//
//  Created by alanood on 19/04/1443 AH.
//


import UIKit
import FirebaseAuth

class WelcomeScreen: UIViewController {

    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.layer.borderWidth = 0.25
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.cornerRadius = 13
        view.clipsToBounds = true
        return view
    }()
    
    let illustrationImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "img3")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    let titleLabel: UILabel = {
      let title = UILabel()
        title.backgroundColor = .clear
        title.text = "Covid-19 Statistics App"
        title.font = UIFont.systemFont(ofSize: 29, weight: .bold)
        title.textColor = .label
        title.textAlignment = .center
        title.numberOfLines = 0
        return title
    }()
    
    let subTitle: UILabel = {
      let subTitle = UILabel()
        subTitle.backgroundColor = .clear
        subTitle.text = "Get the latest COVID-19 news and statistics."
        subTitle.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        subTitle.textColor = .label
        subTitle.textAlignment = .center
        subTitle.numberOfLines = 0
        return subTitle
    }()
    
    let signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setupButton(with: "Sign up")
        return button
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setupButton(with: "Log in")
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setupViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if isUserSignedIn() {
            self.dismiss(animated: true, completion: nil)
        }
       
    }
    
    private func setupViews() {
        
        containerView.translatesAutoresizingMaskIntoConstraints                                                     = false
        
        view.addSubview(containerView)
        
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive                                = true
        containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive                                = true
        containerView.widthAnchor.constraint(equalToConstant: 325).isActive                                         = true
        containerView.heightAnchor.constraint(equalToConstant: 395).isActive                                        = true
        
        
        
        
        let vStack = UIStackView(arrangedSubviews: [signInButton, loginButton])
        
        vStack.distribution = .fillEqually
        vStack.spacing      = 10
        
        vStack.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(vStack)
        
        vStack.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20).isActive                 = true
        vStack.heightAnchor.constraint(equalToConstant: 40).isActive                                                = true
        vStack.widthAnchor.constraint(equalToConstant: 190).isActive                                                = true
        vStack.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive            = true

        

        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        
        subTitle.translatesAutoresizingMaskIntoConstraints                                                          = false
        
        containerView.addSubview(subTitle)
        
        subTitle.bottomAnchor.constraint(equalTo: vStack.topAnchor, constant: -20).isActive                         = true
        subTitle.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive                            = true
        subTitle.widthAnchor.constraint(equalToConstant: 205).isActive                                              = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints                                                        = false
        
        containerView.addSubview(titleLabel)
        
        titleLabel.bottomAnchor.constraint(equalTo: subTitle.topAnchor, constant: -10).isActive                     = true
        titleLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive                          = true
        titleLabel.widthAnchor.constraint(equalToConstant: 250).isActive = true
        
        

        illustrationImage.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(illustrationImage)
        
        illustrationImage.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -5).isActive             = true
        
        illustrationImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: -80).isActive     = true
        
        illustrationImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0).isActive  = true
        
        illustrationImage.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive             = true
        
        

    }
    
    @objc private func loginButtonTapped() {
        navigationController?.pushViewController(LoginScreen(), animated: true)
    }
    @objc private func signInButtonTapped() {
        navigationController?.pushViewController(SignupScreen(), animated: true)
    }
    private func isUserSignedIn() -> Bool {
      return Auth.auth().currentUser != nil
    }
}
