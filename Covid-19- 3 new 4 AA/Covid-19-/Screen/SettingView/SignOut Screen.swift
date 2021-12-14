//
//  SignOut Screen.swift
//  Covid-19-
//
//  Created by alanood on 26/04/1443 AH.
//

import UIKit
import FirebaseAuth

class SettingScreen: UIViewController {
    
    var setting:[Setting] = []
    // let tableView = UITableView(frame: .zero, style: .insetGrouped)
    
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing =  12
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        return cv
    }()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionConstraints()
        setting = [.init(name: "Pick Date".localized, completion: {
            self.openPickDate()
        }, image: UIImage(named: "date")!),.init(name: "Change language".localized, completion: {
            self.changeLanguage()
        }, image: UIImage(named: "lang")!),.init(name: "Hospital Covid".localized, completion: {
            self.openMap()
        }, image: UIImage(named: "location")!),.init(name: "My Dates".localized, completion: {
            self.openListOfMyDates()
        }, image: UIImage(named: "list")!),.init(name: "Add Comment".localized, completion: {
            self.openAddCommitView()
        }, image: UIImage(named: "add")!),.init(name: "List Of Comment".localized, completion: {
            self.openListOfMyCommit()
        }, image: UIImage(named: "send")!)]
        
        
        title = "Setting".localized
        view.backgroundColor = .covidBackground
        //        tableView.delegate = self
        //        tableView.dataSource = self
        //        tableView.rowHeight = 30
        //        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "123")
        //        tableView.backgroundColor = .covidBackground
     
        
        
    }
    
    //    override func viewDidLayoutSubviews() {
    //        super.viewDidLayoutSubviews()
    //        tableView.frame = view.bounds
    //    }
    func changeTheLanguage(to lang: Lang) {
        currentLanguage = lang.rawValue
        UserDefaults.standard.synchronize()
        var title = "Warning"
        var message = "To make the changes appear you need to restart the app"
        if lang == .ar{
            title = "تنبيه"
            message = "لتنفيذ التغييرات الجديدة يجب عليك اعادة تشغيل التطبيق"
        }
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
    func setupCollectionConstraints() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        collectionView.register(SettingCell.self, forCellWithReuseIdentifier: SettingCell.identifier)
    //    collectionView.heightAnchor.constraint(equalToConstant: 340).isActive = true
        collectionView.widthAnchor.constraint(equalToConstant: 340).isActive = true
        collectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    func openMap() {
        let view = LocationOfHospitals()
        let root = UINavigationController(rootViewController: view)
        view.title = "Hospital Covid".localized
        present(root, animated: true)
    }
    func openPickDate() {
        let view = PickDateForCovidView()
        view.title = "Pick Date".localized
        navigationController?.pushViewController(view, animated: true)
    }
    func openListOfMyDates() {
        let view = ListOfMyDateView()
        view.title = "My Dates".localized
        navigationController?.pushViewController(view, animated: true)
    }
    private func openAddCommitView () {
        let view = AddCommentView()
        navigationController?.pushViewController(view, animated: true)
    }
    private func openListOfMyCommit () {
        let view = ListOfMyCommentView()
        navigationController?.pushViewController(view, animated: true)
    }
    func changeLanguage() {
        let arabic = UIAlertAction(title: "عربي", style: .default) { (action) in
            self.changeTheLanguage(to: .ar)
        }
        let english = UIAlertAction(title: "English", style: .default) { (action) in
            self.changeTheLanguage(to: .en)
        }
        let alert = UIAlertController(title: "Change the language".localized.localized, message: nil, preferredStyle: .actionSheet)
        alert.addAction(arabic)
        alert.addAction(english)
        
        present(alert, animated: true)
        
    }
    
}

//extension SettingScreen: UITableViewDelegate, UITableViewDataSource  {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return setting.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "123", for: indexPath)
//        cell.textLabel?.text = setting[indexPath.row].name
//        cell.backgroundColor = .covidOrange
//        cell.textLabel?.textColor = .black
//        cell.selectionStyle = .none
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        setting[indexPath.row].completion()
//    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        50
//    }
//}

extension SettingScreen: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return setting.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SettingCell.identifier, for: indexPath) as! SettingCell
        cell.data = setting[indexPath.row]
     
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 160)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        setting[indexPath.row].completion()
    }
    
}

