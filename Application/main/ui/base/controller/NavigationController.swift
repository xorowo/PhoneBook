//
//  NavigationController.swift
//  PhoneBook
//
//  Created by  Work on 07.09.2023.
//

import UIKit

class NavigationController: UINavigationController, UISearchControllerDelegate, UISearchBarDelegate {

    var searchBar: UISearchBar? {
        topViewController?.navigationItem.titleView as? UISearchBar
    }
    
    func setupSearchBar() {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search"
        topViewController?.navigationItem.titleView = searchBar
    }

}
