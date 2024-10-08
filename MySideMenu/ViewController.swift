//
//  ViewController.swift
//  MySideMenu
//
//  Created by chenzhizs on 2021/04/19.
//

import SideMenu
import UIKit

class ViewController: UIViewController {
    
    private let sideMenu = SideMenuNavigationController(rootViewController: MenuController(with: [
        "Home",
        "Info",
        "Setting",
    ]))

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

class MenuController: UITableViewController {
    private let menuItems: [String]
    private let color = UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 1)
    
    init(with menuItems:[String]) {
        self.menuItems = menuItems
        super.init(nibName: nil, bundle: nil)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init error")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = color
        view.backgroundColor = color
    }
    
    // Table
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell" , for: indexPath)
        cell.textLabel?.text = menuItems[indexPath.row]
        cell.textLabel?.textColor = .white
        cell.backgroundColor = color
        cell.contentView.backgroundColor = color
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
