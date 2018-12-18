//
//  MenuCell.swift
//  BubbleHeader
//
//  Created by Ramon Vasconcelos on 17/12/2018.
//

import UIKit

class MenuCell: UICollectionViewCell {

    private let shadowView = UIView()
    private let imageView = UIImageView()
    private let nameLabel = UILabel()
    private var value: MenuItem!

    // MARK: - Init
    private func updateView() {
        addCellViews()
        setupConstraints()
        setBorders()
    }

    func setBorders() {
        backgroundView?.layer.cornerRadius = (backgroundView?.frame.height)! / 2
        backgroundView?.layer.borderColor = value.selectedBorderColor.cgColor
        backgroundView?.layer.borderWidth = value.selectedBorderWidth

        shadowView.layer.cornerRadius = (backgroundView?.frame.height)! / 2
        shadowView.layer.borderColor = value.shadowColor.cgColor
        shadowView.layer.borderWidth = 1
    }

    func addCellViews() {
        backgroundView = UIView()
        contentView.addSubview(shadowView)

        imageView.contentMode = .scaleAspectFit
        contentView.addSubview(imageView)
        nameLabel.textAlignment = .center
        nameLabel.numberOfLines = 0
        nameLabel.textColor = value.textColor
        nameLabel.font = value.textFont
        contentView.addSubview(nameLabel)
    }

    func setupConstraints() {
        if #available(iOS 11.0, *) {
            insetsLayoutMarginsFromSafeArea = false
        }

        imageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        shadowView.translatesAutoresizingMaskIntoConstraints = false

        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 18).isActive = true

        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        shadowView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -1).isActive = true
        shadowView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 1).isActive = true
        shadowView.topAnchor.constraint(equalTo: topAnchor, constant: -1).isActive = true
        shadowView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 1).isActive = true
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        value = MenuItem(name: "", image: UIImage(named: "")!)
        updateView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        value = MenuItem(name: "", image: UIImage(named: "")!)
        updateView()
    }

    // MARK: - Reuse
    override func prepareForReuse() {
        super.prepareForReuse()

        value = nil
    }

    func apply(_ value: MenuItem) {
        self.value = value

        imageView.image = value.image.withRenderingMode(.alwaysTemplate)
        imageView.highlightedImage = value.highlightedImage
        shadowView.backgroundColor = value.shadowColor
        nameLabel.text = value.name
        updateView()
        updateSelectionVisibility()
    }

    // MARK: - Selection
    private func updateSelectionVisibility() {
        imageView.isHighlighted = isSelected
        backgroundView?.backgroundColor = isSelected ? value?.highlightedBackgroundColor : value?.backgroundColor
        backgroundView?.layer.borderColor = isSelected ? value.selectedBorderColor.cgColor : value.unselectedBorderColor.cgColor
        backgroundView?.layer.borderWidth = isSelected ? value.selectedBorderWidth : value.unselectedBorderWidth
        imageView.tintColor = isSelected ? value.selectedTintColor : value.unselectedTintColor
        UIView.animate(withDuration: 0.2, delay: 0.0 , options: [], animations: {
            self.transform = self.isSelected ? CGAffineTransform(scaleX: 1.3, y: 1.3) : CGAffineTransform.identity
        }, completion: nil)
    }

    override var isSelected: Bool {
        didSet {
            updateSelectionVisibility()
        }
    }
}
