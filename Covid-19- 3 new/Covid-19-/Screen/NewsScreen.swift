//
//  NewsScreen.swift
//  Covid-19-
//
//  Created by alanood on 19/04/1443 AH.
//

import UIKit


class NewsScreen: UIViewController {
    
   
    private var newsArray = News.news
    private var filterNews = News.news
    private var collectionView: UICollectionView!
    private let search = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "News"
        setupSearchBar()
        setupCollectionView()
    }

    private func setupSearchBar() {
        search.loadViewIfNeeded()
        search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.returnKeyType = .done
        search.searchBar.sizeToFit()
        search.searchBar.placeholder = "Search for a article"
        search.hidesNavigationBarDuringPresentation = false
        definesPresentationContext = true
        
        navigationItem.searchController = search
        navigationItem.hidesSearchBarWhenScrolling = true
        search.searchBar.delegate = self
    }
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: setupCompositionalLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = true
        collectionView.register(NewsCollectionViewCell.self, forCellWithReuseIdentifier: NewsCollectionViewCell.id)
        collectionView.backgroundColor = .systemBackground
        view.addSubview(collectionView)
    }


    private func setupCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalWidth(0.6)),
            subitem: item, count: 1
        )
        group.contentInsets =  NSDirectionalEdgeInsets(top: 25, leading: 15, bottom: 0, trailing: 15)
        group.interItemSpacing = .fixed(25)
        let section = NSCollectionLayoutSection(group: group)
        return UICollectionViewCompositionalLayout(section: section)
    }

}


extension NewsScreen: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if search.isActive && !search.searchBar.text!.isEmpty {
            return filterNews.count
        }else{
            return newsArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCollectionViewCell.id, for: indexPath) as! NewsCollectionViewCell
        if search.isActive && !search.searchBar.text!.isEmpty {
            let filtered = filterNews[indexPath.row]
            cell.setCell(title: filtered.title, image: filtered.image, date: filtered.date)
            
            return cell
        }else{
            let news = newsArray[indexPath.row]
            
            cell.setCell(title: news.title, image: news.image, date: news.date)
            return cell
        }
       
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = NewsDetailsScreen()
        vc.articleDate = newsArray[indexPath.row].date
        vc.articlemage = newsArray[indexPath.row].image
        vc.articleDescription = newsArray[indexPath.row].article
        vc.articleTitle = newsArray[indexPath.row].title
        
        navigationController?.pushViewController(vc, animated: true)
    }

    
}


extension NewsScreen: UISearchResultsUpdating, UISearchBarDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
        if !searchController.isActive {
            return
        }
        
        let searchBar = search.searchBar
        
        if let userEnteredSearchText = searchBar.text {
            findResultsBasedOnSearch(with: userEnteredSearchText)
        }
        
        
    }
    private func findResultsBasedOnSearch(with text: String)  {
        filterNews.removeAll()
        if !text.isEmpty {
            filterNews = newsArray.filter{ item in
                item.title.lowercased().contains(text.lowercased())
            }
            collectionView.reloadData()
        }else{
            collectionView.reloadData()
        }
    }
}

