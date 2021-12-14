//
//  PickDateDetails.swift
//  Covid-19-
//
//  Created by alanood on 09/12/2021.
//

import UIKit

class PickDateDetails: UIViewController {

    var details:ListMyDate?
    
    lazy var titleForView:UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Details Your Pick".localized
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.textColor = .covidOrange
        return label
    }()
    lazy var detailsLabel:UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "To see you details , please scan the QR code".localized
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    lazy var QRViewCode : UIImageView = {
       let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(titleForView)
        view.addSubview(QRViewCode)
       view.addSubview(detailsLabel)
        titleForView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 12).isActive = true
        titleForView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        titleForView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        titleForView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        QRViewCode.topAnchor.constraint(equalTo: titleForView.bottomAnchor,constant: 40).isActive = true
        QRViewCode.heightAnchor.constraint(equalToConstant: 150).isActive = true
        QRViewCode.widthAnchor.constraint(equalToConstant: 150).isActive = true
        QRViewCode.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        QRViewCode.image = generateQRCode(from: "Name : \(details?.name ?? ""), Age : \(details?.age ?? 0)")
        
        
        
        detailsLabel.topAnchor.constraint(equalTo: QRViewCode.bottomAnchor,constant: 12).isActive = true
        detailsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        detailsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        detailsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
    }
    func generateQRCode(from string: String) -> UIImage? {
            let data = string.data(using: String.Encoding.ascii)

            if let filter = CIFilter(name: "CIQRCodeGenerator") {
                filter.setValue(data, forKey: "inputMessage")
                let transform = CGAffineTransform(scaleX: 3, y: 3)
                if let output = filter.outputImage?.transformed(by: transform) {
                    return UIImage(ciImage: output)
                }
            }
            return nil
        }


}
