//
//  TabBarController.swift
//  PhoneBook
//
//  Created by  Work on 07.09.2023.
//

import UIKit

class TabBarController: UITabBarController {

    enum Item: CaseIterable {
        case search,
             select
        
        var title: String {
            switch self {
            case .search: return "Search"
            case .select: return "Most Viewed"
            }
        }
        
        var systemImageName: String {
            switch self {
            case .search: return "magnifyingglass"
            case .select: return "checklist"
            }
        }

        var controller: NavigationController {
            func navigation(_ controller: ViewController) -> NavigationController {
                let tabBarItem = UITabBarItem(title: title,
                                              image: UIImage(systemName: systemImageName),
                                              selectedImage: nil)
                controller.tabBarItem = tabBarItem
                return NavigationController(rootViewController: controller)
            }
            
            switch self {
            case .search: return navigation(SearchController.instance)
            case .select: return navigation(SelectController.instance)
            }
        }
    }
    
    //MARK: Life
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = Item.allCases.map({ $0.controller })
        
    }

}
