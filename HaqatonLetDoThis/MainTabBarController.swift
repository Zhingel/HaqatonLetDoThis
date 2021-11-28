//
//  MainTabBarController.swift
//  HacatonStocksChatApp
//
//  Created by Стас Жингель on 26.11.2021.
//

import Foundation
import UIKit
class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
//        DispatchQueue.main.async {
//            let loginViewController = LoginViewController()
//            let navigationController = UINavigationController(rootViewController: loginViewController)
//            navigationController.modalPresentationStyle = .fullScreen
//            self.present(navigationController, animated: true)
//        }
        setupViewControllers()
    }
    
    
    fileprivate func setupViewControllers() {
        view.backgroundColor = .white
        let layout = UICollectionViewFlowLayout()
        let viewController = ProfileViewController()
        let navViewController = UINavigationController(rootViewController: viewController)
        navViewController.tabBarItem.image = UIImage(systemName: "person.circle")
        navViewController.tabBarItem.selectedImage = UIImage(systemName: "person.circle")
        navViewController.navigationBar.scrollEdgeAppearance = navViewController.navigationBar.standardAppearance
        tabBar.tintColor = .black
        let secondViewController = CatalogViewController(collectionViewLayout: layout)
        let nav2ViewController = UINavigationController(rootViewController: secondViewController)
        nav2ViewController.tabBarItem.image = UIImage(systemName: "rectangle.grid.1x2.fill")
        nav2ViewController.tabBarItem.selectedImage = UIImage(systemName: "rectangle.grid.1x2.fill")
        nav2ViewController.navigationBar.scrollEdgeAppearance = nav2ViewController.navigationBar.standardAppearance
        tabBar.tintColor = .black
        viewControllers = [nav2ViewController, navViewController]
    }
}
