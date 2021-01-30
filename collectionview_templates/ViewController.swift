//
//  ViewController.swift
//  collectionview_templates
//
//  Created by Wilson Desimini on 1/28/21.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private let images = ImageDataService.images
    
    private weak var collectionView: UICollectionView!
    private let collectionViewColumnCount = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        let columnCells = self.collectionView.visibleCells.compactMap { $0 as? ImagesColumnCollectionViewCell }
        columnCells.forEach { $0.refreshColumnCells() }
    }
    
    private func configureCollectionView() {
        let newCollectionView = ViewFactory.collectionView(cellClasses: [ImagesColumnCollectionViewCell.self])
        newCollectionView.dataSource = self
        newCollectionView.delegate = self
        collectionView = newCollectionView
        
        view.addSubview(collectionView)
        
        collectionView.pin(to: view, padding: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionViewColumnCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ImagesColumnCollectionViewCell = collectionView.quickDequeue(for: indexPath)
        cell.images = images(forCollectionViewColumn: indexPath.item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = collectionView.frame.width / 2
        
        var maxCellHeight: CGFloat = .zero
        
        for column in 0..<collectionViewColumnCount {
            let imagesForColumn = images(forCollectionViewColumn: column)
            
            var cellHeight: CGFloat = 16
            
            for image in imagesForColumn {
                let multiplier = cellWidth / image.size.width
                let newImageHeight = image.size.height * multiplier
                cellHeight += newImageHeight + 16
            }
            
            maxCellHeight = max(cellHeight, maxCellHeight)
        }
        
        return CGSize(width: cellWidth, height: maxCellHeight)
    }
    
    private func images(forCollectionViewColumn column: Int) -> [UIImage] {
        var columnImages = [UIImage]()
        
        for (i, image) in images.enumerated() {
            let x = i - column
            
            if x < 0 {
                continue
            }
            
            if x.isMultiple(of: collectionViewColumnCount) {
                columnImages.append(image)
            }
        }
        
        return columnImages
    }
}

