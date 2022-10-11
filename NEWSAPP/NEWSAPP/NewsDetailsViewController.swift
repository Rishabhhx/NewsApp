//
//  NewsDetailsViewController.swift
//  NEWSAPP
//
//  Created by Rishabh Sharma on 20/03/22.
//

import UIKit

class NewsDetailsViewController: UIViewController {

    @IBAction func addToFavourites(_ sender: UIButton) {
        favNews.append(AddNews(title: detailsTitle.text!, ShortDescription: detailsShortDescription.text!, LongDescription: detailsFullDescription.text!, isFav: false, imageName: detailsImage.image!, date: "String"))
        
    }
    @IBOutlet weak var detailsTitle: UILabel!
    @IBOutlet weak var detailsShortDescription: UILabel!
    @IBOutlet weak var detailsFullDescription: UILabel!
    @IBOutlet weak var detailsImage: UIImageView!
    var tempTitle : String?
    var tempDesc : String?
    var tempFull : String?
    var tempImage : UIImage?
    
    var tempPageTitle : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let title = tempTitle{
            detailsTitle.text = title
        }
        if let desc = tempDesc{
            detailsShortDescription.text = desc
        }
        if let full = tempFull{
            detailsFullDescription.text = full
        }
        if let img = tempImage{
            detailsImage.image = img
        }

    }
    

}
