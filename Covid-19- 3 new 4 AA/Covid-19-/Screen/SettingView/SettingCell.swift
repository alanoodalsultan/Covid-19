//
//  SettingCell.swift
//  Covid-19-
//
//  Created by alanood on 10/12/2021.
//

import UIKit

class SettingCell: UICollectionViewCell {
    static let identifier = "SettingCell"
    var data:Setting?{
        didSet {
            imageView.image = data?.image
            namelable.text = data?.name
        }
    }
    
      let namelable: UILabel = {
          let label = UILabel()
          label.textColor = .black
          label.font = UIFont.boldSystemFont(ofSize: 18)
          label.textAlignment = .center
          label.numberOfLines = 0
          label.translatesAutoresizingMaskIntoConstraints = false
          return label
      }()
      
      var imageView: UIImageView = {
        let imageView = UIImageView()
       
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
      }()
      
      override init(frame: CGRect) {
          super.init(frame: frame)
          self.addSubview(imageView)
          self.addSubview(namelable)
         backgroundColor = .white
         layer.cornerRadius = 10
         layer.borderWidth = 25
         layer.borderColor = UIColor.clear.cgColor
         layer.masksToBounds = true
         
         layer.shadowColor = UIColor.lightGray.cgColor
         layer.shadowOffset = CGSize(width: 0, height: 2.0)
         layer.shadowRadius = 7
         layer.shadowOpacity = 0.5
         layer.masksToBounds = false
         
          imageView.topAnchor.constraint(equalTo: self.topAnchor,constant: 40).isActive = true
          imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
          imageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
          imageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
 
          namelable.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
          namelable.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
          namelable.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
      
      }
      
      
      required init?(coder aDecoder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
      
      
      
}
