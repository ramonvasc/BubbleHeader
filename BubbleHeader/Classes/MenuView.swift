//
//  MenuView.swift
//  BubbleHeader
//
//  Created by Ramon Vasconcelos on 17/12/2018.
//

import UIKit

private let CellIdentifier = "MenuCell"
private let DefaultContentHeight: CGFloat = 112.0

open class MenuView: StickyHeaderView {

    var selectedCell: UICollectionViewCell?

    // MARK: - Init
    override func commonInit() {
        super.commonInit()

        if backgroundColor == nil {
            backgroundColor = .clear
        }

        contentHeight = DefaultContentHeight

        updateContentLayout()
    }

    // MARK: - FlowLayout
    private lazy var collectionLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return layout
    }()

    // MARK: - CollectionView
    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: self.collectionLayout)
        view.clipsToBounds = false
        view.backgroundColor = .clear
        view.showsHorizontalScrollIndicator = false
        view.register(MenuCell.self, forCellWithReuseIdentifier: CellIdentifier)

        view.delegate = self
        view.dataSource = self

        self.contentView = view

        return view
    }()

    // MARK: - Delegate
    @IBOutlet open weak var delegate: MenuViewDelegate?

    open var items: [MenuItem] = [] {
        didSet {
            collectionView.reloadData()
            selectedIndex = items.count > 0 ? 0 : nil
        }
    }

    @objc open var objcSelectedIndex: Int = 0 {
        didSet {
            selectedIndex = objcSelectedIndex
        }
    }

    open var selectedIndex: Int? = 0 {
        didSet {
            var indexPath: IndexPath?
            if let index = selectedIndex {
                indexPath = IndexPath(item: index, section: 0)
            }

            self.collectionView.selectItem(at: indexPath,
                                           animated: false,
                                           scrollPosition: .centeredHorizontally
            )
        }
    }

    // MARK: - ContentHeight & Layout
    open override var contentHeight: CGFloat {
        didSet {
            updateContentLayout()
        }
    }

    private func updateContentLayout() {
        let inset = ceil(contentHeight / 6.0)
        let spacing = floor(inset / 1.2)

        collectionLayout.minimumLineSpacing = spacing
        collectionLayout.minimumInteritemSpacing = spacing
        collectionView.contentInset = UIEdgeInsets(top: 10.0, left: inset, bottom: 30.0, right: inset)

        collectionLayout.itemSize = CGSize(width: contentHeight - inset * 2.5, height: contentHeight - inset * 2.5)
    }

    public func frameOfItem(at index: Int) -> CGRect {
        let indexPath = IndexPath(item: index, section: 0)
        let layoutAttributes = collectionLayout.layoutAttributesForItem(at: indexPath)!

        return convert(layoutAttributes.frame, from: collectionLayout.collectionView)
    }

}

extension MenuView: UICollectionViewDataSource {

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier,for: indexPath) as! MenuCell
        cell.apply(items[indexPath.item])

        return cell
    }

}

extension MenuView: UICollectionViewDelegate {

    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.item
        delegate?.menu(self, didSelectItemAt: selectedIndex!)
    }

}
