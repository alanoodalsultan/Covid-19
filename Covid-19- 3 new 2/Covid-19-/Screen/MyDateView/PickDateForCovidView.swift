//
//  PickDateForCovidView.swift
//  Covid-19-
//
//  Created by alanood on 08/12/2021.
//

import UIKit

class PickDateForCovidView: UIViewController {
    
    
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
 
    private lazy var datePiker: UIDatePicker = {
       let picker = UIDatePicker()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.datePickerMode = .dateAndTime
        picker.minimumDate = Date()
        if #available(iOS 13.4, *) {
            picker.preferredDatePickerStyle = .wheels
        } else {
        
        }
        return picker
    }()
    private lazy var nameFiled :UITextField = {
        let name = UITextField ()
        name.placeholder = "Enter name".localized
        name.layer.cornerRadius = 25
        name.layer.borderWidth = 0.4
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
        view.addSubview(datePiker)
        view.addSubview(nameFiled)
        view.addSubview(ageFiled)
        view.addSubview(saveButton)
        datePiker.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 12).isActive = true
        datePiker.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        datePiker.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        datePiker.heightAnchor.constraint(equalToConstant: 220).isActive = true
        
        nameFiled.topAnchor.constraint(equalTo: datePiker.bottomAnchor,constant: 10).isActive = true
        nameFiled.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20).isActive = true
        nameFiled.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20).isActive = true
        nameFiled.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        ageFiled.topAnchor.constraint(equalTo: nameFiled.bottomAnchor,constant: 6).isActive = true
        ageFiled.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20).isActive = true
        ageFiled.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20).isActive = true
        ageFiled.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        saveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -50).isActive = true
        saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20).isActive = true
        saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    @objc func didTapOnSave () {
        let name = nameFiled.text ?? "No Name"
        let age = Int(ageFiled.text ?? "0") ?? 0
        let date = datePiker.date
        saveData(name: name, age: age, date: date)
    }
    func saveData (name:String,age:Int,date:Date) {
        let newItem = ListMyDate(context:context)
        newItem.name = name
        newItem.date = date
        newItem.age = Int64(age)
        do {
            try context.save()
            let alert = UIAlertController(title: "data saved".localized, message: "we will contact you ".localized, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: {_ in
                self.navigationController?.popViewController(animated: true)
            }))
            present(alert, animated: true)
        }
        catch {
            
        }
    }
    
    //    func deleteItem (data:ListDatePick) {
    //        context.delete(data)
    //        do {
    //            try context.save()
    //        }
    //        catch {
    //
    //        }
    //
    //    }
    
}
