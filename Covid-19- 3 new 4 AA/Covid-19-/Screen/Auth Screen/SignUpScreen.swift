//
//  SignUpScreen.swift
//  Covid-19-
//
//  Created by alanood on 19/04/1443 AH.
//


import UIKit
import FirebaseAuth
import FirebaseFirestore

class SignupScreen: UIViewController {
    
    let db = Firestore.firestore()
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.layer.borderWidth = 0.25
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.cornerRadius = 13
        view.clipsToBounds = true
        return view
    }()
    
    let titleLabel: UILabel = {
        let title = UILabel()
        title.backgroundColor = .clear
        title.text = "Creating an account \nto get the latest news."
        title.font = UIFont.systemFont(ofSize: 29, weight: .bold)
        title.textColor = .label
        title.textAlignment = .center
        title.numberOfLines = 0
        return title
    }()
    
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.setupTextField(with: NSAttributedString(string: "Email",
                                                          attributes: [NSAttributedString.Key.foregroundColor: UIColor.secondaryLabel]))
        return textField
    }()
    let passwordTextField: UITextField = {
        let textField = UITextField()
        
        textField.setupTextField(with: NSAttributedString(string: "Password",
                                                          attributes: [NSAttributedString.Key.foregroundColor: UIColor.secondaryLabel]))
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        
        textField.setupTextField(with: NSAttributedString(string: "Name",
                                                          attributes: [NSAttributedString.Key.foregroundColor: UIColor.secondaryLabel]))
        return textField
    }()
    
    let createAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.setupButton(with: "Create account")
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupViews()
    }
    
    private func setupViews() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(containerView)
        
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive                                = true
        containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive                                = true
        containerView.widthAnchor.constraint(equalToConstant: 325).isActive                                         = true
        containerView.heightAnchor.constraint(equalToConstant: 425).isActive                                        = true
        
        
        createAccountButton.translatesAutoresizingMaskIntoConstraints = false
        
        createAccountButton.addTarget(self, action: #selector(createAccountButtonTapped), for: .touchUpInside)
        
        containerView.addSubview(createAccountButton)
        
        createAccountButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20).isActive = true
        createAccountButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20).isActive = true
        createAccountButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20).isActive = true
        createAccountButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.delegate = self
        containerView.addSubview(passwordTextField)
        
        passwordTextField.bottomAnchor.constraint(equalTo: createAccountButton.topAnchor, constant: -20).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.delegate = self
        containerView.addSubview(emailTextField)
        
        emailTextField.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -10).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.delegate = self
        containerView.addSubview(nameTextField)
        
        nameTextField.bottomAnchor.constraint(equalTo: emailTextField.topAnchor, constant: -10).isActive = true
        nameTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(titleLabel)
        
        titleLabel.bottomAnchor.constraint(equalTo: nameTextField.topAnchor, constant: -5).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20).isActive = true
        titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20).isActive = true
    }
    
    @objc private func createAccountButtonTapped() {
        guard let email = emailTextField.text else {return}
        guard let password = passwordTextField.text else {return}
        guard let name = nameTextField.text else {return}
        
        if !email.isEmpty && !password.isEmpty && !name.isEmpty{
            signupUserUsing(email: email, password: password, name: name)
        }else{
            let alert = UIAlertController(title: "Oops!", message: "please make sure name, email and password are not empty.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            
            present(alert, animated: true)
        }
        
    }
    func signupUserUsing(email: String, password: String, name: String) {
        Auth.auth().createUser(withEmail: email, password: password) { results, error in
            
            if let error = error as NSError? {
                switch AuthErrorCode(rawValue: error.code) {
                case .emailAlreadyInUse:
                    
                    let alert = UIAlertController(title: "Oops!", message: "email Already in use", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(alert, animated: true)
                    
                case .invalidEmail:
                    
                    let alert = UIAlertController(title: "Oops!", message: "are sure you typed the email correctly?", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(alert, animated: true)
                    
                case .weakPassword:
                    
                    let alert = UIAlertController(title: "Oops!", message: "Your password is weak, please make sure it's strong.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(alert, animated: true)
                    
                default:
                    
                    let alert = UIAlertController(title: "Oops!", message: "\(error.localizedDescription)", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(alert, animated: true)
                    
                }
            }else{
                // Ma feh ay error fra7 nsjl al user...
                guard let user = results?.user else {return}
                
                self.db.collection("Profiles").document(user.uid).setData([
                    "name": name,
                    "email": String(user.email!),
                    "userID": user.uid
                ], merge: true) { err in
                    if let err = err {
                        print("Error writing document: \(err)")
                    } else {
                        print("Document successfully written!")
                    }
                }
                
                self.navigationController?.popViewController(animated: true)
            }
            
            
        }
    }
   
}


extension SignupScreen: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        nameTextField.resignFirstResponder()
        return true
    }
}
