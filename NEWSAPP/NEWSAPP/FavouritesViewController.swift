//
//  FavouritesViewController.swift
//  NEWSAPP
//
//  Created by Rishabh Sharma on 15/03/22.
//

import UIKit

class FavouritesViewController: UIViewController {

    var flag = false

    @IBAction func startEditing(_ sender: Any) {

    }
    
    @IBAction func deleteRows(_ sender: Any) {

    }
    

    @IBOutlet weak var favouritesTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupcollectionView()
        favouritesTableView.delegate = self
        favouritesTableView.dataSource = self
        favouritesTableView.dragInteractionEnabled = true
        favouritesTableView.allowsMultipleSelectionDuringEditing = true
        
    }
    
    func setupcollectionView()
    {
        let cellNib = UINib(nibName: "FavouritesTableViewCell", bundle: nil)
        self.favouritesTableView.register(cellNib,forCellReuseIdentifier: "FavouritesTableViewCell")
            //print(favourites)
    }
    override func viewWillAppear(_ animated: Bool) {
        favouritesTableView.reloadData()
    }
    
    
}
extension FavouritesViewController : UITableViewDelegate, UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favNews.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {

        let cell = favouritesTableView.dequeueReusableCell(withIdentifier: "FavouritesTableViewCell", for: indexPath) as! FavouritesTableViewCell
        cell.favouriteLable.text = favNews[(indexPath.row)].title
        cell.favouriteImage.image = favNews[(indexPath.row)].imageName
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            favNews.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
}

