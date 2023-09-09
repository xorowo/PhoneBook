//
//  ContactTableCell.swift
//  PhoneBook
//
//  Created by  Work on 07.09.2023.
//

import UIKit

final class ContactTableCell: UITableViewCell {
    
    @IBOutlet private weak var contactView: ContactView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func fill(contact: PhoneContact) {
        contactView.fill(contact: contact)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
