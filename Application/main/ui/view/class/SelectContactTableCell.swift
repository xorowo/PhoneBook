//
//  SelectContactTableCell.swift
//  PhoneBook
//
//  Created by  Work on 08.09.2023.
//

import UIKit

class SelectContactTableCell: UITableViewCell {

    @IBOutlet private weak var checkBoxImageView: UIImageView!
    @IBOutlet private weak var contactView: ContactView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let backgroundView = UIView()
        backgroundView.backgroundColor = #colorLiteral(red: 0, green: 0.46, blue: 0.89, alpha: 1).withAlphaComponent(0.1)
        selectedBackgroundView = backgroundView
    }
    
    func fill(contact: PhoneContact) {
        contactView.fill(contact: contact)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        checkBoxImageView.image = UIImage(systemName: selected ? "checkmark.circle.fill" : "circle")
    }
    
}
