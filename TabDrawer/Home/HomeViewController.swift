//
//  HomeViewController.swift
//  TabDrawer
//
//  Created by Neha Harariya on 5/15/25.
//

import UIKit

class HomeViewController: UIViewController {

    let menuViewController = MenuViewController()
    var isSideViewVisible = false
    
    var leadingConstraint: NSLayoutConstraint?
    var menuWidth: CGFloat = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        menuWidth = view.frame.width * 0.8
        addChild(menuViewController)
        menuViewController.view.frame = self.view.frame
        view.addSubview(menuViewController.view)
        menuViewController.didMove(toParent: self)
        if let sideView = menuViewController.view {
            sideView.translatesAutoresizingMaskIntoConstraints = false
            let leadingCo = sideView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -menuWidth)
            leadingConstraint = leadingCo
            NSLayoutConstraint.activate([
                leadingCo,
                sideView.widthAnchor.constraint(equalToConstant: menuWidth),
                sideView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                sideView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            ])
        }
    }
    
    @IBAction func showSideView(_ id: UIBarButtonItem) {
        UIView.animate(withDuration: 0.3) {
            if self.isSideViewVisible {
                self.leadingConstraint?.constant = -self.menuWidth
            } else {
                self.leadingConstraint?.constant = 0
            }
            self.view.layoutIfNeeded()
        } completion: { success in
            if success {
                self.isSideViewVisible.toggle()
            }
        }
    }
}
