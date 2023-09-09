//
//  Application.swift
//  PhoneBook
//
//  Created by  Work on 08.09.2023.
//

import Foundation
import UIKit

final class Application {
    
    static let shared = Application()
    
    var userDefaults = UserDefaults.standard
    
    private var sceneDelegate: SceneDelegate? {
        UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
    }
    private var window: UIWindow? {
        sceneDelegate?.window
    }
    
    private func setupInterface() {
        window?.rootViewController = TabBarController()
    }
    
    private func setupContacts() {
        let contactsService = PhoneContactsService()
        contactsService.getContacts { contacts in
            contactsService.convert(contacts: contacts) { items in
                let sortItems = items.sorted(by: { $0.fullName < $1.fullName })
                self.userDefaults.setContacts(sortItems)
                DispatchQueue.main.async {
                    self.setupInterface()
                }
            }
        }
    }
    
    private func setupData() {
        setupContacts()
    }
    
    func setup() {
        setupData()
    }
    
}
