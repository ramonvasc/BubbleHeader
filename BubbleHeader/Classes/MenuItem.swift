//
//  MenuItem.swift
//  BubbleHeader
//
//  Created by Ramon Vasconcelos on 17/12/2018.
//

import UIKit

public struct MenuItem {

    public var image: UIImage
    public var highlightedImage: UIImage?

    public var backgroundColor = UIColor(red: 50.0 / 255.0, green: 49.0 / 255.0, blue: 73.0 / 255.0, alpha: 1.0)
    public var highlightedBackgroundColor = UIColor(red: 1.0, green: 61.0 / 255.0, blue: 130.0 / 255.0, alpha: 1.0)

    public var shadowColor = UIColor(white: 0.1, alpha: 0.3)

    public var name: String

    public var selectedBorderColor = UIColor.yellow

    public var unselectedBorderColor = UIColor.clear

    public var selectedTintColor = UIColor.blue

    public var unselectedTintColor = UIColor.white

    public var selectedBorderWidth: CGFloat = 3

    public var unselectedBorderWidth: CGFloat = 0

    public var textColor = UIColor.black

    public var textFont = UIFont.systemFont(ofSize: 12)

    // MARK: - Init

    public init(name: String, image: UIImage, highlightedImage: UIImage? = nil, selectedBorderColor: UIColor = UIColor.yellow, unselectedBorderColor: UIColor = UIColor.clear, selectedTintColor: UIColor = UIColor.blue, unselectedTintColor: UIColor = UIColor.white, textColor: UIColor = UIColor.black, selectedBorderWidth: CGFloat = 3, unselectedBorderWidth: CGFloat = 0, textFont: UIFont = UIFont.systemFont(ofSize: 12)) {
        self.name = name
        self.image = image
        self.highlightedImage = highlightedImage
        self.selectedBorderColor = selectedBorderColor
        self.unselectedBorderColor = unselectedBorderColor
        self.selectedTintColor = selectedTintColor
        self.unselectedTintColor = unselectedTintColor
        self.textColor = textColor
        self.selectedBorderWidth = selectedBorderWidth
        self.unselectedBorderWidth = unselectedBorderWidth
        self.textFont = textFont
    }

}
