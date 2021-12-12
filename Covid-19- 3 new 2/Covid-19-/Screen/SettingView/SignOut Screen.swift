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
    let tableView = UITableView(frame: .zero, style: .insetGrouped)
  
    override func viewDidLoad() {
        super.viewDidLoad()
        setting = [.init(name: "Pick Date".localized, completion: {
            self.openPickDate()
        })
                   ,.init(name: "Change language".localized, completion: {
            self.changeLanguage()
        }),.init(name: "Hospital Covid".localized, completion: {
            self.openMap()
        }),.init(name: "My Dates".localized, completion: {
            self.openListOfMyDates()
        }),.init(name: "Add Comment".localized, completion: {
            self.openAddCommitView()
        }),.init(name: "List Of Comment".localized, completion: {
            self.openListOfMyCommit()
        })]
        
        
        title = "Setting".localized
        view.backgroundColor = .covidBackground
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 30
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "123")
        tableView.backgroundColor = .covidBackground
        view.addSubview(tableView)
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
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
    
    func openMap() {
        let view = LocationOfHospitals()
        let root = UINavigationController(rootViewController: view)
        view.title = "Hospital Covid".localized
     present(root, animated: true)
       // navigationController?.pushViewController(view, animated: true)
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
        let view = AddCommitView()
        navigationController?.pushViewController(view, animated: true)
    }
    private func openListOfMyCommit () {
        let view = ListOfMyCommitView()
        navigationController?.pushViewController(view, animated: true)
    }
    //
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

extension SettingScreen: UITableViewDelegate, UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return setting.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "123", for: indexPath)
        cell.textLabel?.text = setting[indexPath.row].name
        cell.backgroundColor = .covidgrey
        cell.textLabel?.textColor = .black
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        setting[indexPath.row].completion()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
}

