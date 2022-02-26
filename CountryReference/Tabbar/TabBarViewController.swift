//
//  TabBarViewController.swift
//  My Recipes
//
//  Created by Aysel Heydarova 25.02.22.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self

        let continentsViewController = ContinentsViewController()
        let navigationController = UINavigationController(rootViewController: continentsViewController)
        navigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 0)

        let searchCountriesViewController = SearchCountriesViewController()
        let searchNavigationController = UINavigationController(rootViewController: searchCountriesViewController)
        searchNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 1)

        viewControllers = [navigationController, searchNavigationController]
    }
}
