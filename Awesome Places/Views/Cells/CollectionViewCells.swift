//
//  CollectionViewCells.swift
//  Awesome Places
//
//  Created by Gaurav Patel on 11/03/25.
//

import UIKit


//For Main Screen
class CategoryCollectionViewCell: UICollectionViewCell {
     
    @IBOutlet weak var categoryTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with category: Category){
        categoryTitle.text = category.title
        categoryTitle.backgroundColor = category.color.withAlphaComponent(0.5)
    }
}
