//
//  NewsDetailsScreen.swift
//  Covid-19-
//
//  Created by alanood on 19/04/1443 AH.
//

import UIKit



class NewsDetailsScreen: UIViewController {
    var articlemage: UIImage?
    var articleTitle: String?
    var articleDescription: String?
    var articleDate: String?

    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let articleImageView: UIImageView =  {
        let image           = UIImageView()
        image.contentMode   = .scaleToFill
        image.clipsToBounds = true
        
        return image
    }()
    private let articleTitleLabel: UILabel = {
        let title = UILabel()
        title.textColor     =  .label
        title.numberOfLines   = 0
        title.textAlignment   = .left
        title.font          = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 25, weight: .bold))
        return title
    }()
    private let articleBodyLabel: UILabel = {
        let description             = UILabel()
        description.textColor       =  .label
        description.font            = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 16, weight: .regular))
        description.numberOfLines   = 0
        description.textAlignment   = .left
        
        return description
    }()
    private let articleDateLabel: UILabel = {
        let description             = UILabel()
        description.textColor       =  .systemGray
        description.font            = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 13, weight: .regular))
        description.numberOfLines   = 0
        description.textAlignment   = .left
        return description
    }()

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "News".localized
        setupScrollView()
        setupView()
        
    }
    override func viewDidAppear(_ animated: Bool) {
       scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height+20)
    }
    
    private func setupView() {
        contentView.backgroundColor = .systemGray6
        scrollView.backgroundColor = .systemGray6
        view.backgroundColor = .systemGray6

        articleImageView.translatesAutoresizingMaskIntoConstraints          = false
        articleTitleLabel.translatesAutoresizingMaskIntoConstraints     = false
        articleDateLabel.translatesAutoresizingMaskIntoConstraints      = false
        articleBodyLabel.translatesAutoresizingMaskIntoConstraints      = false

        contentView.addSubview(articleImageView)
        contentView.addSubview(articleTitleLabel)
        contentView.addSubview(articleDateLabel)
        contentView.addSubview(articleBodyLabel)
        NSLayoutConstraint.activate([
            
            
            articleImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 5),
            articleImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            articleImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            articleImageView.heightAnchor.constraint(equalToConstant: view.frame.size.height / 3.65),

            articleDateLabel.topAnchor.constraint(equalTo: articleImageView.bottomAnchor, constant: 5),
            articleDateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            articleDateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            articleTitleLabel.topAnchor.constraint(equalTo: articleDateLabel.bottomAnchor, constant: 8),
            articleTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            articleTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            articleBodyLabel.topAnchor.constraint(equalTo: articleTitleLabel.bottomAnchor, constant: 13),
            articleBodyLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            articleBodyLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20)
        ])
        
        

        articleImageView.image = articlemage!
        articleDateLabel.text = articleDate!
        articleTitleLabel.text = articleTitle
        articleBodyLabel.text = articleDescription

        
    }
    
    func setupScrollView(){
            scrollView.isScrollEnabled = true
           scrollView.translatesAutoresizingMaskIntoConstraints = false
           contentView.translatesAutoresizingMaskIntoConstraints = false

           view.addSubview(scrollView)
           scrollView.addSubview(contentView)
           
           scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
           scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
           scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
           scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
           
           contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
           contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
           contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
           contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
       }
}
