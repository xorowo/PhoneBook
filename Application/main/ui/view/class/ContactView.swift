//
//  ContactView.swift
//  PhoneBook
//
//  Created by  Work on 08.09.2023.
//

import UIKit

final class ContactView: View {

    @IBOutlet private weak var imgView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var phoneLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgView.layer.cornerRadius = 20
    }
    
    func fill(contact: PhoneContact) {
        imgView.image = contact.imageUser
        nameLabel.text = contact.fullName
        phoneLabel.text = contact.phonesString
    }
    
}
