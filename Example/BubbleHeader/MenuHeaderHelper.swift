//
//  MenuHeaderHelper.swift
//  BubbleHeader_Example
//
//  Created by Ramon Vasconcelos on 17/12/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import BubbleHeader

enum MenuSection: Int {
    case Happy
    case Satisfied
    case Bad
    case SuperHappy
    case SuperSad
    case Dissatisfied
}

protocol MenuHeaderDelegate: class {
    func didSelectItem(index: Int, controller: UIViewController)
}

class MenuHeaderHelper: MenuViewDelegate {

    static let sharedInstance = MenuHeaderHelper()
    weak var delegate: MenuHeaderDelegate?
    static let menuImages = ["Happy", "Satisfied", "Bad", "Super Happy", "Super Sad", "Dissatisfied"]

    let items = (0..<5).map({ (index) -> MenuItem in

        var menuItem = MenuItem(name: menuImages[index], image: UIImage(named: menuImages[index])!, highlightedImage: UIImage(named: menuImages[index])!)
        return menuItem
    })

    func getMenu() -> MenuView {
        let menu = MenuView()
        menu.items = items
        menu.delegate = self
        return menu
    }

    func menu(_ menu: MenuView, didSelectItemAt index: Int) {
        let menuSection = MenuSection(rawValue: index)!
        let controller = SelectedViewController()
        switch menuSection {
        case .Happy:
            print("Happy at position \(index) selected")
            controller.title = "Happy"
        case .Satisfied:
            print("Satisfied at position \(index) selected")
            controller.title = "Satisfied"
        case .Bad:
            print("Bad at position \(index) selected")
            controller.title = "Bad"
        case .SuperHappy:
            print("Super Happy at position \(index) selected")
            controller.title = "Super Happy"
        case .SuperSad:
            print("Super Sad at position \(index) selected")
            controller.title = "Super Sad"
        case .Dissatisfied:
            print("Dissatisfied at position \(index) selected")
            controller.title = "Dissatisfied"
        }
        delegate?.didSelectItem(index: index, controller: controller)
    }

}
