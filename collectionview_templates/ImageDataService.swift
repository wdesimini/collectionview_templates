//
//  ImageDataService.swift
//  collectionview_templates
//
//  Created by Wilson Desimini on 1/28/21.
//

import UIKit

struct ImageDataService {
    private static let imageNames = [
        "gleb-albovsky-wUipvJNqgzw-unsplash",
        "joel-protasio-ZTaixh3Yc8s-unsplash",
        "joshua-lawrence-0YF6r6NcIQo-unsplash",
        "kym-mackinnon-f3ITqoZOP6E-unsplash",
        "mike-palmowski-Aqo0PiobYxk-unsplash",
        "nikhil-singh-zzAyexANejU-unsplash",
        "philip-graves-QeVzrg2eE1Y-unsplash",
    ]
    
    static var images: [UIImage] {
        imageNames.compactMap { UIImage(named: $0) }
    }
}
