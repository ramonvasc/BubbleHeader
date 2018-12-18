//
//  MenuViewDelegate.swift
//  BubbleHeader
//
//  Created by Ramon Vasconcelos on 17/12/2018.
//

import Foundation

@objc public protocol MenuViewDelegate {

    func menu(_ menu: MenuView, didSelectItemAt index: Int)

}
