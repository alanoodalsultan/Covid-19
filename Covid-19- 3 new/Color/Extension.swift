//
//  Ex.swift
//  Covid-19-
//
//  Created by alanood on 20/04/1443 AH.
//

import UIKit

extension UIButton {
    open func setupButton(with title: String) {
        backgroundColor = .tertiarySystemBackground
        setTitle(title, for: .normal)
        setTitleColor(.label, for: .normal)
        layer.cornerRadius = 13
        clipsToBounds = true
        layer.borderColor = UIColor.label.cgColor
        layer.borderWidth = 0.25
    }
    
    open func setupButton(using image: String) {
        setImage(UIImage(systemName: image)?.withTintColor(.covidText, renderingMode: .alwaysOriginal), for: .normal)
        backgroundColor = .clear
        layer.borderColor = UIColor.label.cgColor
    }
}
extension UIColor {
    static func colorFor(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: 1)
    }
}

extension URL {
    func get<T: Codable>(completion: @escaping (Result<T, ApiError>) -> Void) {
        let session = URLSession.shared
        let task = session.dataTask(with: self) { data, _, error in
            if let _ = error {
                DispatchQueue.main.async {
                    completion(.failure(.generic))
                }
                return
            }
            
            guard let unwrapped = data else {
                DispatchQueue.main.async {
                    completion(.failure(.generic))
                }
                return
            }

            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            if let result = try? decoder.decode(T.self, from: unwrapped) {
                DispatchQueue.main.async {
                    completion(.success(result))
                }
            }
            else {
                DispatchQueue.main.async {
                    completion(.failure(.generic))
                }
            }
        }
        
        task.resume()
    }
}

enum ApiError: Error {
    case generic
}

extension ApiError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .generic:
            return NSLocalizedString("Could not retrieve data", comment: "")
        }
    }
}
extension UIView {
    func autolayoutAddSubview(_ view: UIView) {
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}
extension UIViewController {
    func presentOkAlertWithMessage(_ message: String) {
        let alertvc = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertvc.addAction(action)
        self.present(alertvc, animated: true, completion: nil)
    }
}
