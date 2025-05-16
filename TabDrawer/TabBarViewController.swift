//
//  TabBarViewController.swift
//  TabDrawer
//
//  Created by Neha Harariya on 5/15/25.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.isTranslucent = false
        tabBar.backgroundColor = .systemGray5
    }
}

