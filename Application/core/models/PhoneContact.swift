//
//  PhoneContact.swift
//  PhoneBook
//
//  Created by  Work on 07.09.2023.
//

import Foundation
import UIKit.UIImage

struct PhoneContact: Codable, Equatable {
    static func ==(lhs: PhoneContact, rhs: PhoneContact) -> Bool {
        lhs.avatar == rhs.avatar &&
        lhs.fullName == rhs.fullName &&
        lhs.phonesString == rhs.phonesString
    }
    
    let avatar: Data?
    let giveName: String?
    let familyName: String?
    let middleName: String?
    let phonesString: String?
    
    var fullName: String {
        "\(familyName ?? "") \(giveName ?? "") \(middleName ?? "")"
    }
    
    var imageUser: UIImage? {
        guard let imageData = avatar else {
            return UIImage(named: "user.default.circle")
        }
        return UIImage(data: imageData)
    }
}

extension UserDefaults {
    
    func setContacts<Object: Encodable>(_ objects: [Object]) {
        setObjects(objects, forKey: "contacts")
    }
    
    func getContacts() -> [PhoneContact] {
        getObjects(PhoneContact.self, forKey: "contacts")
    }
    
}
