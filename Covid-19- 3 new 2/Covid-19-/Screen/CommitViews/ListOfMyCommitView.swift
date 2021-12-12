//
//  ListOfMyCommitView.swift
//  Covid-19-
//
//  Created by alanood on 10/12/2021.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ListOfMyCommitView: UIViewController {
    
    let tableView = UITableView(frame: .zero, style: .insetGrouped)
    let db = Firestore.firestore()
    let currentUser = Auth.auth().currentUser
    var MyCommit = [String](){
        didSet{
            tableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        getAllData()
        title = "Comments".localized
        view.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 30
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "123")
        tableView.backgroundColor = .white
        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    private func getAllData() {
        db.collection("Commits").addSnapshotListener { querySnapshot, error in
            if let e = error {
                print("There was an issue retrieving data from Firestore. \(e)")
            } else {
                
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        let commit = data["commit"] as! String
                        self.MyCommit.append(commit)
                    }
                }
            }
        }
    }
}
    extension ListOfMyCommitView: UITableViewDelegate, UITableViewDataSource  {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            MyCommit.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "123", for: indexPath)
            cell.textLabel?.text = MyCommit[indexPath.row]
            cell.backgroundColor = .lightGray
            cell.textLabel?.textColor = .black
            cell.selectionStyle = .none
            return cell
        }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            50
        }
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           
        }
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
          if editingStyle == .delete {
              db.collection("Commits").document(currentUser!.uid).delete() { err in
                  if let err = err {
                      print("Error removing document: \(err)")
                  } else {
                      print("Document successfully removed!")
                      self.navigationController?.popViewController(animated: true)
                  }
              }
          }
        }
        
    }
