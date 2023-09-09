//
//  SelectController.swift
//  PhoneBook
//
//  Created by  Work on 07.09.2023.
//

import UIKit

final class SelectController: ViewController {

    //MARK: Properties
    override class var instance: Self! {
        .board(name: "Select", id: "screen.select")
    }
    
    override var isHiddenNavigationBar: Bool { true }
    
    private var contacts = [PhoneContact]() {
        didSet {
            tableView.reloadData()
        }
    }
    private var selectedContacts = [PhoneContact]() {
        didSet {
            if collectionView.isHidden != selectedContacts.isEmpty {
                UIView.animate(withDuration: 0.35) { [self] in
                    collectionView.isHidden = selectedContacts.isEmpty
                    collectionView.layoutIfNeeded()
                }
            }
            collectionView.reloadData()
        }
    }
    
    //MARK: Outlets
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var tableView: UITableView!
    
    //MARK: Life
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        tableView.register(UINib(nibName: "SelectContactTableCell",
                                 bundle: nil),
                           forCellReuseIdentifier: "main")
        
        tableView.dataSource = self
        tableView.delegate = self
        
        contacts = Application.shared.userDefaults.getContacts()
    }

}

//MARK: UITableViewDataSource
extension SelectController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = contacts[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "main",
                                                 for: indexPath) as! SelectContactTableCell
        cell.fill(contact: item)
        return cell
    }
}


//MARK: UITableViewDelegate
extension SelectController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        selectedContacts.append(contacts[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView,
                   didDeselectRowAt indexPath: IndexPath) {
        selectedContacts.removeAll(where: { $0 == contacts[indexPath.row] })
    }
    func tableView(_ tableView: UITableView,
                   willDisplay cell: UITableViewCell,
                   forRowAt indexPath: IndexPath) {
        let animation = TableAnimationFactory.makeSlideIn(duration: 0.5, delayFactor: 0.05)
        let animator = TableAnimator(animation: animation)
        animator.animate(cell: cell, at: indexPath, in: tableView)
    }
}

//MARK: UICollectionViewDataSource
extension SelectController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        selectedContacts.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = selectedContacts[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "main", for: indexPath)
        cell.contentView.layer.cornerRadius = 40
        (cell.viewWithTag(100) as? UIImageView)?.image = item.imageUser 
        return cell
    }
}

//MARK: UICollectionViewDelegate
extension SelectController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 80, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        15
    }
    
}
