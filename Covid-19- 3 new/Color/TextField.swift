//
//  TextField.swift
//  Covid-19-
//
//  Created by alanood on 23/04/1443 AH.
//


import UIKit

extension UITextField {
    open func setupTextField(with placeholder: NSAttributedString) {
        backgroundColor = .tertiarySystemBackground
        autocorrectionType = .no
        layer.cornerRadius = 13
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.label.cgColor
        clipsToBounds = true
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        leftViewMode = .always
        attributedPlaceholder = placeholder
        tintColor = .label
        textColor = .label
        
    }
}
