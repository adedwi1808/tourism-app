//
//  MainTabBarController.swift
//  tourism-app
//
//  Created by Ade Dwi Prayitno on 18/11/25.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
    }
    
    private func setupViewControllers() {
        let homeVC = createHomeNavigation()
        let profileVC = createProfileNavigation()
        
        viewControllers = [homeVC, profileVC]
    }
    
    private func createHomeNavigation() -> UINavigationController {
        let networkService: NetworkerProtocol = Networker()
        let homeServices: HomeServicesProtocol = HomeServices(networker: networkService)
        let homeViewModel = HomeViewModel(services: homeServices)
        let homeVC = HomeViewController(viewModel: homeViewModel)
        
        let nav = UINavigationController(rootViewController: homeVC)
        nav.tabBarItem = UITabBarItem(
            title: "Home",
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill")
        )
        return nav
    }
    
    private func createProfileNavigation() -> UINavigationController {
        let profileViewModel = ProfileViewModel()
        let profileVC = ProfileViewController(viewModel: profileViewModel)
        
        let nav = UINavigationController(rootViewController: profileVC)
        nav.tabBarItem = UITabBarItem(
            title: "Profile",
            image: UIImage(systemName: "person"),
            selectedImage: UIImage(systemName: "person.fill")
        )
        return nav
    }
}

