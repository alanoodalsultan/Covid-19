//
//  CovidCollectionViewCell.swift
//  Covid-19-
//
//  Created by alanood on 22/04/1443 AH.
//

import UIKit

class CovidCollectionViewCell: UICollectionViewCell {
    
    static let id = "1122"
    
    let nameLabel: UILabel = {
       let lbl = UILabel()
        lbl.textColor = .label
        lbl.numberOfLines = 0
        lbl.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        return lbl
    }()
    let infectedLabel: UILabel = {
       let lbl = UILabel()
        lbl.textColor = .label.withAlphaComponent(0.8)
        lbl.numberOfLines = 0
        lbl.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return lbl
    }()
    let updatedLabel: UILabel = {
       let lbl = UILabel()
        lbl.textColor = .systemGray
        lbl.numberOfLines = 0
        lbl.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        return lbl
    }()
    let recoveredLabel: UILabel = {
       let lbl = UILabel()
        lbl.textColor = .label
        lbl.numberOfLines = 0
        lbl.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return lbl
    }()
    let testedLabel: UILabel = {
       let lbl = UILabel()
        lbl.textColor = .label
        lbl.numberOfLines = 0
        lbl.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return lbl
    }()
    let deceasedLabel: UILabel = {
       let lbl = UILabel()
        lbl.textColor = .label
        lbl.numberOfLines = 0
        lbl.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return lbl
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented") }
    
    
    private func setupView() {
        
        configureCell()
        
        
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        updatedLabel.translatesAutoresizingMaskIntoConstraints = false
        
        deceasedLabel.translatesAutoresizingMaskIntoConstraints = false
        testedLabel.translatesAutoresizingMaskIntoConstraints = false
        recoveredLabel.translatesAutoresizingMaskIntoConstraints
        = false
        infectedLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(updatedLabel)
        contentView.addSubview(nameLabel)
        contentView.addSubview(deceasedLabel)
        contentView.addSubview(testedLabel)
        contentView.addSubview(recoveredLabel)
        contentView.addSubview(infectedLabel)
        NSLayoutConstraint.activate([
        
           
            updatedLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            updatedLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            updatedLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            nameLabel.topAnchor.constraint(equalTo: updatedLabel.bottomAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            infectedLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            infectedLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            infectedLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            testedLabel.topAnchor.constraint(equalTo: infectedLabel.bottomAnchor, constant: 8),
            testedLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            testedLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            recoveredLabel.topAnchor.constraint(equalTo: testedLabel.bottomAnchor, constant: 8),
            recoveredLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            recoveredLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            deceasedLabel.topAnchor.constraint(equalTo: recoveredLabel.bottomAnchor, constant: 8),
            deceasedLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            deceasedLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
        ])
    }
    
    private func configureCell() {
        self.backgroundColor = .secondarySystemBackground
        self.layer.cornerRadius = 8
        self.layer.shadowColor = UIColor.black.withAlphaComponent(0.45).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 4.0)
        self.layer.shadowRadius = 8.5
        self.layer.shadowOpacity = 0.5
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: 8).cgPath
        self.layer.cornerCurve  = .continuous
    }
    
    func setCell(name: String, updated: String, deceased: String, tested: String, recovered: String, infected: String) {
        
        nameLabel.text = name
        
        updatedLabel.text = formateDate(stringToDate(updated))
        
        
        
        let testedImage = NSTextAttachment()
        
        testedImage.image = UIImage(systemName: "lungs.fill")?.withTintColor(.systemGray5, renderingMode: .alwaysOriginal)
        
        let testedString = NSMutableAttributedString(attachment: testedImage)
        testedString.append(NSAttributedString(string: " Tested: ".uppercased()  + tested))
        
        testedLabel.attributedText = testedString
        
        //---
        
        let infectedImage = NSTextAttachment()
        
        infectedImage.image = UIImage(systemName: "allergens")?.withTintColor(.systemRed, renderingMode: .alwaysOriginal)
        
        let infectedString = NSMutableAttributedString(attachment: infectedImage)
        infectedString.append(NSAttributedString(string: "  Infected: ".uppercased()  + infected))
        
        infectedLabel.attributedText = infectedString
        
        //---
        let deceasedImage = NSTextAttachment()
        
        deceasedImage.image = UIImage(systemName: "waveform.path.ecg")?.withTintColor(.systemGray, renderingMode: .alwaysOriginal)
        
        let deceasedString = NSMutableAttributedString(attachment: deceasedImage)
        deceasedString.append(NSAttributedString(string: "   Deceased: ".uppercased() + deceased))
        
        deceasedLabel.attributedText = deceasedString
        
        
        //---
        
        let recoveredImage = NSTextAttachment()
        
        recoveredImage.image = UIImage(systemName: "cross.fill")?.withTintColor(.systemGreen, renderingMode: .alwaysOriginal)
        
        let recoveredString = NSMutableAttributedString(attachment: recoveredImage)
        recoveredString.append(NSAttributedString(string: "   Recovered: ".uppercased() + recovered))
        
        recoveredLabel.attributedText = recoveredString
    }
    
    func stringToDate(_ string: String) -> Date {
        
        let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.locale    = .current
        
        if formatter.date(from: string) != nil {
            return formatter.date(from: string)!
        }else{
            return Date()
        }
    }
    func formateDate(_ date: Date) -> String {
        
        let formatter           = DateFormatter()
        formatter.timeZone      = .current
        formatter.locale        = .current
        formatter.dateFormat    = "MMM d, h:mm a"
        return formatter.string(from: date)
    }
}


    
