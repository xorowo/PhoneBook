//
//  ViewController.swift
//  PhoneBook
//
//  Created by  Work on 07.09.2023.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Properties
    var value: Any?
    var isHiddenNavigationBar: Bool {
        false
    }
    var navigation: NavigationController? {
        navigationController as? NavigationController
    }
    
    class func board(name: String, id: String, isPresent: Bool = false) -> Self {
        let vc = UIStoryboard(name: name, bundle: nil).instantiateViewController(withIdentifier: id) as! Self
        if isPresent {
            vc.modalPresentationStyle = .overFullScreen
        }
        return vc
    }
    
    class var instance: Self! {
        nil
    }
    
    class func instance(value: Any?) -> Self {
        let vc = instance!
        vc.value = value
        return vc
    }
    
    //MARK: Life
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGroupedBackground
    }
    
    override open func viewWillAppear(_ animated: Bool) {
        if isHiddenNavigationBar {
            navigationController?.setNavigationBarHidden(true, animated: true)
        }
        super.viewWillAppear(animated)
    }
    
    override open func viewWillDisappear(_ animated: Bool) {
        if isHiddenNavigationBar {
            navigationController?.setNavigationBarHidden(false, animated: true)
        }
        super.viewWillDisappear(animated)
    }

}
