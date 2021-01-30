//
//  ViewFactory.swift
//  collectionview_templates
//
//  Created by Wilson Desimini on 1/28/21.
//

import UIKit

struct ViewFactory {
    static func collectionView(cellClasses: [AnyClass], cellSpacing: CGFloat = 0) -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = cellSpacing
        layout.minimumInteritemSpacing = cellSpacing
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        cellClasses.forEach { collectionView.quickRegister($0) }
        return collectionView
    }
}
