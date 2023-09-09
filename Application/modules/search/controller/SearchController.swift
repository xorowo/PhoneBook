//
//  SearchController.swift
//  PhoneBook
//
//  Created by  Work on 07.09.2023.
//

import UIKit

final class SearchController: ViewController {
    //MARK: Properties
    override class var instance: Self! {
        .board(name: "Search", id: "screen.search")
    }
    
    private var contacts = [PhoneContact]() {
        didSet {
            filterContacts = contacts
        }
    }
    private var filterContacts = [PhoneContact]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    //MARK: Outlets
    @IBOutlet private weak var tableView: UITableView!
    
    //MARK: Life
    override func viewDidLoad() {
        super.viewDidLoad()
        navigation?.setupSearchBar()
        navigation?.searchBar?.delegate = self
       
        tableView.register(UINib(nibName: "ContactTableCell",
                             bundle: nil),
                       forCellReuseIdentifier: "main")
        
        tableView.dataSource = self
        tableView.delegate = self
        
        contacts = Application.shared.userDefaults.getContacts()
    }

}

//MARK: UITableViewDataSource
extension SearchController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        filterContacts.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = filterContacts[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "main",
                                                 for: indexPath) as! ContactTableCell
        cell.fill(contact: item)
        return cell
    }
    
    
}

//MARK: UITableViewDelegate
extension SearchController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   willDisplay cell: UITableViewCell,
                   forRowAt indexPath: IndexPath) {
        let animation = TableAnimationFactory.makeSlideIn(duration: 0.5, delayFactor: 0.05)
        let animator = TableAnimator(animation: animation)
        animator.animate(cell: cell, at: indexPath, in: tableView)
    }
}

//MARK: UISearchBarDelegate
extension SearchController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
            guard !searchText.isEmpty else {
                self.filterContacts = self.contacts
                return
            }
            let lowerSearchText = searchText.lowercased()
            self.filterContacts = self.contacts.filter({ $0.fullName.lowercased().contains(lowerSearchText) || ($0.phonesString ?? "").contains(lowerSearchText) })
        }
    }
    
}


