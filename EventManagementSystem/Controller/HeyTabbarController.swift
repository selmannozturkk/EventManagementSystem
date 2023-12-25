//
//  HeyTabbarController.swift
//  EventManagementSystem
//
//  Created by kadir on 23.12.2023.
//

import UIKit

class HeyTabbarController: UITabBarController {
    
    let userDatabase = UserDatabaseManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if userDatabase.currentUser?.usreRole != .Admin {
            viewControllers?.remove(at: 0)
        }
    }
}
