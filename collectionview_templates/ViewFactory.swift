//
//  ViewFactory.swift
//  collectionview_templates
//
//  Created by Wilson Desimini on 1/28/21.
//

import UIKit

struct ViewFactory {
    static func collectionView(cellClasses: [AnyClass]) -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        cellClasses.forEach { collectionView.quickRegister($0) }
        return collectionView
    }
}
