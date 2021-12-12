//
//  tabBar.swift
//  Covid-19-
//
//  Created by alanood on 20/04/1443 AH.
//

import UIKit

class CovidTabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        viewControllers = [
        
            barItem(tabBarTitle: "Covid", tabBarImage: UIImage(systemName: "facemask")!.withTintColor(UIColor.covidText, renderingMode: .alwaysOriginal), viewController: HomeScreen()),
            
            
               barItem(tabBarTitle: "News", tabBarImage: UIImage(systemName: "newspaper")!.withTintColor(UIColor.covidText, renderingMode: .alwaysOriginal), viewController: NewsScreen()),
            
            
               barItem(tabBarTitle: "out", tabBarImage: UIImage(systemName: "person")!.withTintColor(UIColor.covidText, renderingMode: .alwaysOriginal), viewController: SettingScreen()),
            
            
               barItem(tabBarTitle: "profile", tabBarImage: UIImage(systemName: "person")!.withTintColor(UIColor.covidText, renderingMode: .alwaysOriginal), viewController: ProfileScreen()),
                
           
        ]
        selectedIndex = 0
        tabBar.isTranslucent = true
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.covidText], for: .selected)
        tabBar.unselectedItemTintColor = .gray
    }
    

    private func barItem(tabBarTitle: String, tabBarImage: UIImage, viewController: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem.title = tabBarTitle
        navigationController.tabBarItem.image = tabBarImage
        navigationController.navigationBar.prefersLargeTitles = true
        return navigationController
    }
}



