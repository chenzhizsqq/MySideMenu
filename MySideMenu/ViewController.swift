//
//  ViewController.swift
//  MySideMenu
//
//  Created by chenzhizs on 2021/04/19.
//

import SideMenu
import UIKit

class ViewController: UIViewController {
    
    private let sideMenu = SideMenuNavigationController(rootViewController: UIViewController())

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        sideMenu.leftSide = true
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
    }


    @IBAction func didTapMenuButton() {
        present(sideMenu, animated: true)
    }
}

