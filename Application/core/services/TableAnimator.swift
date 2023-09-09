//
//  Animator.swift
//  PhoneBook
//
//  Created by  Work on 09.09.2023.
//

import UIKit.UITableView

typealias TableAnimation = (UITableViewCell, IndexPath, UITableView) -> Void

final class TableAnimator {
    private var hasAnimatedAllCells = false
    private let animation: TableAnimation

    init(animation: @escaping TableAnimation) {
        self.animation = animation
    }

    func animate(cell: UITableViewCell, at indexPath: IndexPath, in tableView: UITableView) {
        guard !hasAnimatedAllCells else {
            return
        }

        animation(cell, indexPath, tableView)

        hasAnimatedAllCells = tableView.isLastVisibleCell(at: indexPath)
    }
}

enum TableAnimationFactory {
    static func makeSlideIn(duration: TimeInterval, delayFactor: Double) -> TableAnimation {
        return { cell, indexPath, tableView in
            cell.transform = CGAffineTransform(translationX: -tableView.bounds.width, y: 0)

            UIView.animate(
                withDuration: duration,
                delay: delayFactor * Double(indexPath.row),
                options: [.curveEaseInOut],
                animations: {
                    cell.transform = CGAffineTransform(translationX: 0, y: 0)
            })
        }
    }
}
