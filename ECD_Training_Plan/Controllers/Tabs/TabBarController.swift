//
//  TabBarController.swift
//  ECD_Training_Plan
//
//  Created by Мария Межова on 10.08.2022.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()
        
    }
    
    private func setupControllers() {
        
        let homeVC = HomeViewController()
        homeVC.title = "Home"
        let profileVC = ProfileViewController()
        profileVC.title = "Profile"
        
        homeVC.navigationItem.largeTitleDisplayMode = .always
        profileVC.navigationItem.largeTitleDisplayMode = .always
        
        let nav1 = UINavigationController(rootViewController: homeVC)
        let nav2 = UINavigationController(rootViewController: profileVC)
        
        nav1.navigationBar.prefersLargeTitles = true
        nav2.navigationBar.prefersLargeTitles = true
        
        nav1.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "figure.strengthtraining.traditional"), tag: 2)
        
        setViewControllers([nav1, nav2], animated: true)
        
    }

}
