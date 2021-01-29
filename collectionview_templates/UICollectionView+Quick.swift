//
//  UICollectionView+Quick.swift
//  collectionview_templates
//
//  Created by Wilson Desimini on 1/28/21.
//

import UIKit

extension UICollectionView {
    func quickRegister(_ cellClass: AnyClass) {
        register(cellClass, forCellWithReuseIdentifier: String(describing: cellClass.self))
    }
    
    func quickDequeue<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        dequeueReusableCell(withReuseIdentifier: String(describing: T.self), for: indexPath) as! T
    }
}
