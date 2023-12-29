//
//  ProfileVC.swift
//  plantier2
//
//  Created by Анастасия Колодина on 29.12.2023.
//

import Foundation

import UIKit //пустой профиль

class ProfileVC: UIViewController, UITabBarDelegate {
    var tabBar: UITabBar? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        self.view.backgroundColor = Customs.beige
        createMenu()
    }
    
    func createMenu() {
        let tabBar = UITabBar()
        tabBar.delegate = self
        let tabBarHeight: CGFloat = 80.0
        tabBar.barTintColor = UIColor.darkGray
        self.tabBar = tabBar
        tabBar.layer.cornerRadius = tabBarHeight / 2.0
        tabBar.layer.masksToBounds = true
        
        
        let promoTabBarItem = UITabBarItem(title: nil, image: UIImage(named: "main")!.withRenderingMode(.alwaysOriginal), tag: 0)
        let feedTabBarItem = UITabBarItem(title: "фид", image: UIImage(named: "feed"), tag: 2)
        let profileTabBarItem = UITabBarItem(title: "мой сад", image: UIImage(named: "profile"), tag: 3)
        
        
        promoTabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -8)
        feedTabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -8)
        profileTabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -8)
        
        
        tabBar.setItems([feedTabBarItem, promoTabBarItem, profileTabBarItem], animated: false)
        
        
        view.addSubview(tabBar)
        
        
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        tabBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        tabBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        tabBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        tabBar.heightAnchor.constraint(equalToConstant: tabBarHeight).isActive = true
        
        
        tabBar.centerYAnchor.constraint(equalTo: tabBar.centerYAnchor).isActive = true
    }
    
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        switch item.tag {
        case 0:
            let viewController = FeedVC()
            navigationController?.pushViewController(viewController, animated: true)
        case 1:
            let viewController = ProfileVC()
            navigationController?.pushViewController(viewController, animated: true)
        case 2:
            let viewController = HomeVC()
            navigationController?.pushViewController(viewController, animated: true)
        default:
            break
        }
    }
    
}

