//
//  ListOfMyDateView.swift
//  Covid-19-
//
//  Created by alanood on 08/12/2021.
//

import UIKit

class ListOfMyDateView: UIViewController {

    let tableView = UITableView(frame: .zero, style: .insetGrouped)
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var myList:[ListMyDate] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 30
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "123")
        tableView.backgroundColor = .white
        view.addSubview(tableView)
        getAllData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
        func getAllData () {
            do {
            let item = try context.fetch(ListMyDate.fetchRequest())
                self.myList = item
            }
            catch {
    
            }
    
        }
        
}
extension ListOfMyDateView: UITableViewDelegate, UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "123", for: indexPath)
        cell.textLabel?.text = "pick For name".localized + " : " + (myList[indexPath.row].name ?? "")
        cell.backgroundColor = .lightGray
        cell.textLabel?.textColor = .black
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let view = PickDateDetails()
        view.details = myList[indexPath.row]
        view.modalPresentationStyle = .popover
        view.modalTransitionStyle = .coverVertical
        present(view, animated: true)
    }
}

