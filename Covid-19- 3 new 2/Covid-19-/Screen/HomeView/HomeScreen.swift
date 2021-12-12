//
//  ViewController.swift
//  Covid-19-
//
//  Created by alanood on 19/04/1443 AH.
//

import UIKit
import FirebaseAuth

class HomeScreen: UIViewController {
    
    private var covidManager = CovidManager()
    private var covidarray:[CovidModel] = []
    private var filterCountry: [CovidModel] = []
    private var collectionView: UICollectionView!
    private let search = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray6
        title = "Covid".localized
        covidManager.delegate = self
        covidManager.getCovidData()
        setupSearchBar()
        setupCollectionView()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if !isUserIsSignedIn() {
            showWelcomeScreen()
            
        }
        
    }
    private func setupSearchBar() {
        search.loadViewIfNeeded()
        search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.returnKeyType = .done
        search.searchBar.sizeToFit()
        search.searchBar.placeholder = "Search for a country".localized
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
        collectionView.register(CovidCollectionViewCell.self, forCellWithReuseIdentifier: CovidCollectionViewCell.id)
        collectionView.backgroundColor = .systemGray6
        view.addSubview(collectionView)
    }
    private func isUserIsSignedIn() -> Bool {
        return Auth.auth().currentUser != nil
    }
    private func showWelcomeScreen() {
        let vc = UINavigationController(rootViewController: WelcomeScreen())
        vc.modalTransitionStyle = .flipHorizontal
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
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

extension HomeScreen:CovidDelegate{
    func didUpdateDataforCovid(_ covidManager: CovidManager, covidData: [CovidModel]) {
        covidarray = covidData
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
}

extension HomeScreen: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if search.isActive && !search.searchBar.text!.isEmpty {
            return filterCountry.count
        }else{
            return covidarray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CovidCollectionViewCell.id, for: indexPath) as! CovidCollectionViewCell
        if search.isActive && !search.searchBar.text!.isEmpty {
            let filtered = filterCountry[indexPath.row]
            cell.setCell(name: filtered.country.uppercased(),
                         updated: filtered.lastUpdatedApify,
                         deceased: filtered.deceased?.get() ?? "Not Registered",
                         tested: filtered.tested?.get() ?? "Not Registered",
                         recovered: filtered.recovered?.get() ?? "Not Registered",
                         infected: "\(filtered.infected ?? 0)")
            return cell
        }else{
            let covid = covidarray[indexPath.row]
            
            cell.setCell(name: covid.country.uppercased(),
                         updated: covid.lastUpdatedApify,
                         deceased: covid.deceased?.get() ?? "Not Registered",
                         tested: covid.tested?.get() ?? "Not Registered",
                         recovered: covid.recovered?.get() ?? "Not Registered",
                         infected: "\(covid.infected ?? 0)")
            return cell
        }
       
    }
    

    
}


extension HomeScreen: UISearchResultsUpdating, UISearchBarDelegate {
    
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
        filterCountry.removeAll()
        if !text.isEmpty {
            filterCountry = covidarray.filter{ item in
                item.country.lowercased().contains(text.lowercased())
            }
            collectionView.reloadData()
        }else{
            collectionView.reloadData()
        }
    }
}
