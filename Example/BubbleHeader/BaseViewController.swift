//
//  BaseViewController.swift
//  BubbleHeader
//
//  Created by Ramon Vasconcelos on 12/17/2018.
//  Copyright (c) 2018 Ramon Vasconcelos. All rights reserved.
//

import UIKit
import BubbleHeader

class BaseViewController: UIViewController {

    let menuHeaderHelper = MenuHeaderHelper.sharedInstance
    var menuTableView = UITableView()
    var menu: MenuView?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        menuTableView = UITableView(frame: view.bounds)
        menuTableView.isScrollEnabled = false
        menuTableView.backgroundColor = .clear
        menuTableView.tableFooterView = UIView()
        view.addSubview(menuTableView)
        menuHeaderHelper.delegate = self
        menu = menuHeaderHelper.getMenu()
        menuTableView.tableHeaderView = menu!
        menu?.backgroundColor = .yellow
        menu?.revealed = true
    }

}

extension BaseViewController: MenuHeaderDelegate {

    func didSelectItem(index: Int, controller: UIViewController) {
        // Load selected controller
    }

}
