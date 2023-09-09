//
//  ContactsService.swift
//  PhoneBook
//
//  Created by  Work on 07.09.2023.
//

import Foundation
import Contacts

struct PhoneContactsService {
    
    func getContacts(completion: @escaping(([CNContact]) -> Void)) {
        let keys: [Any] = [
            CNContactFormatter.descriptorForRequiredKeys(for: .fullName),
            CNContactThumbnailImageDataKey,
            CNContactPhoneNumbersKey
        ]
        var contacts = [CNContact]()
        let request = CNContactFetchRequest(keysToFetch: keys as! [CNKeyDescriptor])
        let contactStore = CNContactStore()
        
        DispatchQueue.global().async {
            try? contactStore.enumerateContacts(with: request, usingBlock: { contact, _ in
                contacts.append(contact)
            })
            completion(contacts)
        }
    }
    
    func convert(contacts: [CNContact],
                 completion: @escaping(([PhoneContact]) -> Void)) {
        DispatchQueue.global().async {
            var phoneContacts = [PhoneContact]()
            contacts.forEach({ contact in
                let phonesString = contact.phoneNumbers.map({ $0.value.stringValue }).joined(separator: "\n")
                
                let phoneContact = PhoneContact(avatar: contact.thumbnailImageData,
                                                giveName: contact.givenName,
                                                familyName: contact.familyName,
                                                middleName: contact.middleName,
                                                phonesString: phonesString)
                
                phoneContacts.append(phoneContact)
            })
            completion(phoneContacts)
        }
    }

}
