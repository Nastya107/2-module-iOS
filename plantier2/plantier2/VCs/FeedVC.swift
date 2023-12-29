//
//  FeedVC.swift
//  plantier2
//
//  Created by Анастасия Колодина on 29.12.2023.
//

import Foundation

import UIKit //фид

class FeedVC: UIViewController, UITabBarDelegate {
    
    var tabBar: UITabBar? = nil

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the background color to white
        self.view.backgroundColor = Customs.beige
        
                
        
       
        createMenu()
        configureTitleFeed()
        displayAvatarAndName()
        displayPlantAndName()
        
    }
    
    
    func createMenu() {
        let tabBar = UITabBar()
        tabBar.delegate = self
        let tabBarHeight: CGFloat = 80.0 // Высота вашего tabBar
        tabBar.barTintColor = UIColor.darkGray
        self.tabBar = tabBar
        tabBar.layer.cornerRadius = tabBarHeight / 2.0 // Устанавливаем радиус скругления
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
    
    func configureTitleFeed() {
        
        let label = UILabel()
        label.text = "Новые растения"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 26)

        
        view.addSubview(label)

        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    }
    
    func displayAvatarAndName() {
        let avatarImageView = UIImageView()
        avatarImageView.image = UIImage(named: "avatar1")
        avatarImageView.contentMode = .scaleAspectFit
        avatarImageView.clipsToBounds = true
        avatarImageView.layer.cornerRadius = avatarImageView.bounds.width / 2
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false

        let nameLabel = UILabel()
        nameLabel.text = "polirybka"
        nameLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        nameLabel.textColor = .black
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        let stackView = UIStackView(arrangedSubviews: [avatarImageView, nameLabel])
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150), // это отступ от верхнего края экрана
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    func displayPlantAndName() {
        // создаем для изображения растения
        let plantImageView = UIImageView()
        plantImageView.image = UIImage(named: "Plant")
        plantImageView.contentMode = .scaleAspectFit
        plantImageView.clipsToBounds = true
        plantImageView.translatesAutoresizingMaskIntoConstraints = false

        // создаем штуку для подписи
        let nameLabel = UILabel()
        nameLabel.text = "Суккулент Чан"
        nameLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        nameLabel.textColor = .black
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

       
        let stackView = UIStackView(arrangedSubviews: [plantImageView, nameLabel])
        stackView.axis = .vertical
        stackView.spacing = 8 // расстояние между изображением и подписью
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false

      
        view.addSubview(stackView)

        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100), // это отступ от верхнего края экрана
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -20)
        ])
    }






    
    
    
    
    // UITabBarDelegate method to handle tab selection
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        // Handle tab selection based on the item's tag or any custom logic
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




