//
//  ImageCollectionViewCell.swift
//  collectionview_templates
//
//  Created by Wilson Desimini on 1/28/21.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureCellContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCellContents() {
        contentView.addSubview(imageView)
        
        imageView.pin(to: contentView)
    }
}
