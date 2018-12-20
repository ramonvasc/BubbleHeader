//
//  MenuItem.swift
//  BubbleHeader
//
//  Created by Ramon Vasconcelos on 17/12/2018.
//

import UIKit

public struct MenuItem {

    public var image: UIImage

    public var highlightedImage: UIImage

    public var backgroundColor = UIColor.clear

    public var highlightedBackgroundColor = UIColor.white

    public var shadowColor = UIColor(white: 0.1, alpha: 0.1)

    public var name: String

    public var selectedBorderColor = UIColor.red

    public var unselectedBorderColor = UIColor.clear

    public var selectedTintColor = UIColor.blue

    public var unselectedTintColor = UIColor.white

    public var selectedBorderWidth: CGFloat = 3

    public var unselectedBorderWidth: CGFloat = 0

    public var textColor = UIColor.black

    public var textFont = UIFont.systemFont(ofSize: 10)

    // MARK: - Init

    public init(name: String, image: UIImage, highlightedImage: UIImage, shadowColor: UIColor = UIColor(white: 0.1, alpha: 0.1), selectedBorderColor: UIColor = UIColor.red, unselectedBorderColor: UIColor = UIColor.clear, selectedTintColor: UIColor = UIColor.blue, unselectedTintColor: UIColor = UIColor.white, textColor: UIColor = UIColor.black, selectedBorderWidth: CGFloat = 3, unselectedBorderWidth: CGFloat = 0, textFont: UIFont = UIFont.systemFont(ofSize: 10)) {
        self.name = name
        self.image = image
        self.highlightedImage = highlightedImage
        self.shadowColor = shadowColor
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
