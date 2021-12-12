//
//  AddCommitView.swift
//  Covid-19-
//
//  Created by alanood on 10/12/2021.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class AddCommitView: UIViewController {
    
    let db = Firestore.firestore()
   let currentUser = Auth.auth().currentUser
    private lazy var commitFiled :UITextField = {
        let name = UITextField ()
        name.placeholder = "Enter your comment".localized
        name.layer.cornerRadius = 25
        name.layer.borderWidth = 1
        name.layer.borderColor = UIColor.covidOrange.cgColor
        name.translatesAutoresizingMaskIntoConstraints = false
        name.textAlignment = .center
        return name
    }()
    private lazy var nameFiled :UITextField = {
        let name = UITextField ()
        name.placeholder = "Enter name".localized
        name.layer.cornerRadius = 25
        name.layer.borderWidth = 1
        name.layer.borderColor = UIColor.covidOrange.cgColor
        name.translatesAutoresizingMaskIntoConstraints = false
        name.textAlignment = .center
        return name
    }()
    private lazy var ageFiled :UITextField = {
        let age = UITextField ()
        age.placeholder = "Enter age".localized
        age.layer.cornerRadius = 25
        age.layer.borderWidth = 0.4
        age.layer.borderColor = UIColor.covidOrange.cgColor
        age.translatesAutoresizingMaskIntoConstraints = false
        age.textAlignment = .center
        age.keyboardType = .asciiCapableNumberPad
        
        return age
    }()
    private lazy var saveButton: UIButton  = {
        let button = UIButton()
        button.setTitle("save".localized, for: .normal)
        button.layer.cornerRadius = 25
        button.backgroundColor = .covidOrange
        button.tintColor = .white
        button.addTarget(self, action: #selector(didTapOnSave), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    private func setupUI () {
        view.backgroundColor = .white
        view.addSubview(commitFiled)
        view.addSubview(nameFiled)
        //view.addSubview(ageFiled)
        view.addSubview(saveButton)
        commitFiled.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 12).isActive = true
        commitFiled.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20).isActive = true
        commitFiled.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20).isActive = true
        commitFiled.heightAnchor.constraint(equalToConstant: 220).isActive = true
        
        nameFiled.topAnchor.constraint(equalTo: commitFiled.bottomAnchor,constant: 10).isActive = true
        nameFiled.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20).isActive = true
        nameFiled.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20).isActive = true
        nameFiled.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
//        ageFiled.topAnchor.constraint(equalTo: nameFiled.bottomAnchor,constant: 6).isActive = true
//        ageFiled.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20).isActive = true
//        ageFiled.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20).isActive = true
//        ageFiled.heightAnchor.constraint(equalToConstant: 50).isActive = true
//
        saveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -50).isActive = true
        saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20).isActive = true
        saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    @objc func didTapOnSave () {
        guard let commitText = commitFiled.text, !commitText.isEmpty else {return}
        saveImageToFirestore(commits: commitText)
    }
    
    func saveImageToFirestore(commits: String) {
        guard let userId = currentUser?.uid else { return }
        db.collection("Commits").document(userId).setData(["commit":commits], merge: true) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
                    self.navigationController?.popViewController(animated: true)
            }
        }
    }
}

