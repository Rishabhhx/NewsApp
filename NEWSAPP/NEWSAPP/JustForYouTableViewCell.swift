//
//  JustForYouTableViewCell.swift
//  NEWSAPP
//
//  Created by Rishabh Sharma on 14/03/22.
//

import UIKit

class JustForYouTableViewCell: UITableViewCell {
    @IBOutlet weak var JustForYouCollectionView: UICollectionView!
    var detailsTapped2 : (() -> Void)?
    var clouser : ((_ iteam : Int) -> () )?

    override func awakeFromNib() {
        super.awakeFromNib()
        JustForYouCollectionView.delegate = self
        JustForYouCollectionView.dataSource = self
        setupcollectionView()

        // Initialization code
    }
    func setupcollectionView()
    {
        let cellNib = UINib(nibName: "JustForYouCollectionViewCell", bundle: nil)
        self.JustForYouCollectionView.register(cellNib, forCellWithReuseIdentifier: "JustForYouCollectionViewCell")
    }
    func justReload()
    {
        JustForYouCollectionView.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension JustForYouTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (recent.count >= 3 ? 3 : recent.count)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = JustForYouCollectionView.dequeueReusableCell(withReuseIdentifier: "JustForYouCollectionViewCell", for: indexPath) as! JustForYouCollectionViewCell
        cell.detailsTapped = {
            self.detailsTapped2?()
        }
        
        cell.justForYouTitle.text = recent[(indexPath.item)].title
        cell.justForYouLable.text = recent[(indexPath.item)].ShortDescription
        cell.justForYouImageView.image = recent[(indexPath.item)].imageName

        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        clouser!(indexPath.item)
    }

}
extension JustForYouTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}
