//
//  CovidCollectionViewCell.swift
//  Covid-19-
//
//  Created by alanood on 22/04/1443 AH.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {
    
    static let id = "11223324"
   
    let containerView: UIView = {
       let view = UIView()
        view.backgroundColor = .black.withAlphaComponent(0.6)
        return view
    }()
    let ImageView: UIImageView = {
       let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        return img
    }()
    let titleLabel: UILabel = {
       let lbl = UILabel()
        lbl.textColor = .white
        lbl.numberOfLines = 2
        lbl.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return lbl
    }()

    let dateLabel: UILabel = {
       let lbl = UILabel()
        lbl.textColor = .white
        lbl.numberOfLines = 0
        lbl.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented") }
    
    
    private func setupView() {
        
        configureCell()
        
        
        ImageView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(ImageView)
        contentView.addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(dateLabel)
       

        NSLayoutConstraint.activate([
        
            
            ImageView.topAnchor.constraint(equalTo: topAnchor),
            ImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            ImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            ImageView.bottomAnchor.constraint(equalTo: bottomAnchor),

            
            containerView.bottomAnchor.constraint(equalTo: ImageView.bottomAnchor, constant: 0),
            containerView.trailingAnchor.constraint(equalTo: ImageView.trailingAnchor, constant: 0),
            containerView.leadingAnchor.constraint(equalTo: ImageView.leadingAnchor, constant: 0),
            containerView.heightAnchor.constraint(equalToConstant: 80),
               
            dateLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 5),
            dateLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            dateLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            
            titleLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
        ])
    }
    
    private func configureCell() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 8
        self.clipsToBounds = true
    }
    
    func setCell(title: String, image: UIImage, date: String) {
        
        ImageView.image = image
        
        titleLabel.text = title
 
        dateLabel.text = date.uppercased()
    }
    

}


    

