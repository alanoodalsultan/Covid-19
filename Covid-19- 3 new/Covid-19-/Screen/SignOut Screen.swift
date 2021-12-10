//
//  SignOut Screen.swift
//  Covid-19-
//
//  Created by alanood on 26/04/1443 AH.
//

import UIKit
import FirebaseAuth

class SettingScreen: UIViewController {

        let tableView = UITableView(frame: .zero, style: .grouped)
        let buttons = ["Sign Out"]
        
        override func viewDidLoad() {
            super.viewDidLoad()

            title = "Settings"
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
        
    }

    extension SettingScreen: UITableViewDelegate, UITableViewDataSource  {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return buttons.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "123", for: indexPath)
            cell.textLabel?.text = buttons[indexPath.row]
            cell.backgroundColor = .white
            cell.textLabel?.textColor = .black
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            
            if buttons[indexPath.row] == "Sign Out" {
                do{try Auth.auth().signOut()}
                catch {print("already logged out")}
                navigationController?.popToRootViewController(animated: true)
            }
        }
    }

