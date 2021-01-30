//
//  ImagesColumnCollectionViewCell.swift
//  collectionview_templates
//
//  Created by Wilson Desimini on 1/29/21.
//

import UIKit

class ImagesColumnCollectionViewCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var images = [UIImage]()
    
    private weak var collectionView: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureColumnCellContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureColumnCellContents() {
        let newCollectionView = ViewFactory.collectionView(cellClasses: [ImageCollectionViewCell.self], cellSpacing: 16)
        newCollectionView.isScrollEnabled = false
        newCollectionView.dataSource = self
        newCollectionView.delegate = self
        collectionView = newCollectionView
        
        contentView.addSubview(collectionView)
        
        collectionView.pin(to: contentView)
    }
    
    func refreshColumnCells() {
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
            return
        }
        
        layout.invalidateLayout()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ImageCollectionViewCell = collectionView.quickDequeue(for: indexPath)
        cell.image = images[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width - 16
        let image = images[indexPath.item]
        let height = image.size.height * width / image.size.width
        return CGSize(width: width, height: height)
    }
}
