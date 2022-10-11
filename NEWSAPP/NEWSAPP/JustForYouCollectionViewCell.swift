//
//  JustForYouCollectionViewCell.swift
//  NEWSAPP
//
//  Created by Rishabh Sharma on 14/03/22.
//

import UIKit

class JustForYouCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var justForYouLable: UILabel!
    @IBOutlet weak var justForYouTitle: UILabel!
    @IBOutlet weak var justForYouImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        detailsTapped?()
        // Initialization code
    }
    var detailsTapped : (() -> Void)?

    
}
