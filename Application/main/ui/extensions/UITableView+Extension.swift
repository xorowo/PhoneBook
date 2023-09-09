//
//  UITableView+Extension.swift
//  PhoneBook
//
//  Created by  Work on 09.09.2023.
//

import UIKit.UITableView

extension UITableView {
    func isLastVisibleCell(at indexPath: IndexPath) -> Bool {
        guard let lastIndexPath = indexPathsForVisibleRows?.last else {
            return false
        }

        return lastIndexPath == indexPath
    }
}
