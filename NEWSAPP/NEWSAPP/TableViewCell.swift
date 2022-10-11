//
//  TableViewCell.swift
//  NEWSAPP
//
//  Created by Rishabh Sharma on 14/03/22.
//

import UIKit


class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var newsimageView: UIImageView!
    @IBOutlet weak var newsDescription: UILabel!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var button: UIButton!
    var buttonPressedClosure: ((Bool) -> ())?

    var flag = true
    
    @IBAction func button(_ sender: UIButton) {
        if flag == false
                {
                    button.setImage(UIImage(named: "black"), for: .normal)
                    flag = true
                }
                else
                {
                    button.setImage(UIImage(named: "red"), for: .normal)
                    flag = false
                    
                }
        buttonPressedClosure!(flag)

        favNews.append(AddNews(title: newsTitle.text!, ShortDescription: newsDescription.text!, LongDescription: newsDescription.text!, isFav: false, imageName: newsimageView.image!, date: "String"))

    }
    var detailsTapped2 : (() -> Void)?


    override func awakeFromNib() {
        super.awakeFromNib()
        if let title = tempTitle{
            newsTitle.text = title
        }
        if let desc = tempDesc{
            newsDescription.text = desc
        }
        if let img = tempImage{
            newsimageView.image = img
        }

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        button.setImage(UIImage(named: "black"), for: .normal)


        // Configure the view for the selected state
    }
    var tempTitle : String?
    var tempDesc : String?
    var tempImage : UIImage?
    
    var tempPageTitle : String?
    

    

}
