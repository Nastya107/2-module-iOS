//
//  PromoVC.swift
//  plantier2
//
//  Created by Анастасия Колодина on 29.12.2023.
//

import Foundation

import UIKit //о нас

enum Customs {
    static let green = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)
    static let beige = UIColor(red: 0.9843, green: 0.9686, blue: 0.9451, alpha: 1.0)
    static let lightGray = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1.0)
    static let menuColor = UIColor(red: 77.0, green: 77.0, blue: 77.0, alpha: 1.0)

    static let cornerRadius: CGFloat = 60.0
}


class HomeVC: UIViewController, UITabBarDelegate {
    
    var tabBar: UITabBar? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Цвет фона
        self.view.backgroundColor = Customs.beige
        
    
        createMenu()
        
       
        configureBlock()
        configureBlock1()
        configureBlock2()
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
        
        // Центрируем содержимое UITabBar по вертикали
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
    
    func configureBlock () {
        let block = UIImageView()
        block.image = UIImage(named: "flower1")
        block.translatesAutoresizingMaskIntoConstraints = false
        block.contentMode = .scaleAspectFit
        block.clipsToBounds = true
        block.layer.cornerRadius = 8
        
        
      
        view.addSubview(block)
        
        
        let topConstraint = block.topAnchor.constraint(equalTo: view.topAnchor, constant: -300) // тут отступ 20 от верхней границы экрана
        topConstraint.isActive = true
        
        block.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        block.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        block.bottomAnchor.constraint(equalTo: tabBar?.topAnchor ?? view.bottomAnchor).isActive = true
    }
    
    
    
    
    
    func configureBlock1 () {
        let block1 = UIImageView()
        block1.image = UIImage(named: "logo1")
        block1.translatesAutoresizingMaskIntoConstraints = false
        block1.contentMode = .scaleAspectFit
        block1.clipsToBounds = true
        block1.layer.cornerRadius = 8
        
        
        view.addSubview(block1)
        
        
        let topConstraint = block1.topAnchor.constraint(equalTo: view.topAnchor, constant: 80)
        topConstraint.isActive = true
        block1.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        block1.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        block1.bottomAnchor.constraint(equalTo: tabBar?.topAnchor ?? view.bottomAnchor).isActive = true
        
       
        let label = UILabel()
        label.text = "Медиа-сервис домашнего растениеводства"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 24)
        
        
        
        view.addSubview(label)
        
      
        label.topAnchor.constraint(equalTo: block1.bottomAnchor, constant: -270).isActive = true
        label.leadingAnchor.constraint(equalTo: block1.leadingAnchor, constant: 20).isActive = true
        label.trailingAnchor.constraint(equalTo: block1.trailingAnchor, constant: -20).isActive = true
    }
    
    func configureBlock2 () {
        let block2 = UIImageView()
        block2.image = UIImage(named: "flower2")
        block2.translatesAutoresizingMaskIntoConstraints = false
        block2.contentMode = .scaleAspectFit
        block2.clipsToBounds = true
        block2.layer.cornerRadius = 8
        
        
        
        view.addSubview(block2)
        
      
        let topConstraint = block2.topAnchor.constraint(equalTo: view.topAnchor, constant: 500)
        topConstraint.isActive = true
        
        block2.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        block2.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        block2.bottomAnchor.constraint(equalTo: tabBar?.topAnchor ?? view.bottomAnchor).isActive = true
    }
}
