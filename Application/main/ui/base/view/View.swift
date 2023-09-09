//
//  View.swift
//  PhoneBook
//
//  Created by  Work on 08.09.2023.
//

import UIKit

class View: UIView {
        
    @IBOutlet var contentView: UIView!
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        
        Bundle.main.loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)
        
        addConstraints(
            NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|",
                                           options: [],
                                           metrics: nil,
                                           views: ["view": contentView!])
        )
        addConstraints(
            NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|",
                                           options: [],
                                           metrics: nil,
                                           views: ["view": contentView!])
        )
        
    }
    
}
