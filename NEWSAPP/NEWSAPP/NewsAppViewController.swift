//
//  ViewController.swift
//  NEWSAPP
//
//  Created by Rishabh Sharma on 14/03/22.
//

import UIKit
//var sectionArr = [StringConstant.section1.rawValue , StringConstant.section2.rawValue]
class NewsAppViewController: UIViewController {

    @IBOutlet weak var grettingLable: UILabel!
    @IBOutlet var headerView: UIView!
    @IBOutlet weak var tableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        grettingLable.text = gretting() + ", " + StringConstant.userName.rawValue
        tableView.delegate = self
        tableView.dataSource = self
        setupTableView()
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        section()
      //  insertData()
        
    }
    var sections = ["Recents"]
    func section()
    {
        for (key,_) in dictSort
        {
            sections.append(key)
        }
        
    }
        
    
    func gretting() -> String
    {
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        var stringName = " "
        switch hour {
        case 6..<12 :
            stringName.insert(contentsOf: "Good Morning", at: stringName.startIndex )
            return stringName
        case 12..<17 : stringName.insert(contentsOf: "Good Afternoon", at: stringName.startIndex )
            return stringName
        case 17..<24 : stringName.insert(contentsOf: "Good Evening", at: stringName.startIndex )
            return stringName
        default:
            return "OK"
        }
    }
    func setupTableView()
    {
        let cellNib = UINib(nibName: "TableViewCell", bundle: nil)
        self.tableView.register(cellNib,forCellReuseIdentifier: "TableViewCell")
        tableView.tableHeaderView = headerView
        let cellNib2 = UINib(nibName: "JustForYouTableViewCell", bundle: nil)
        self.tableView.register(cellNib2,forCellReuseIdentifier: "JustForYouTableViewCell")
    }


}
extension NewsAppViewController : UITableViewDelegate, UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return dictSort.count+1
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {


       
        switch indexPath.section{
        case 0:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "NewsDetailsViewController")
            as! NewsDetailsViewController

            vc.tempTitle = addNews1[indexPath.row].title
            vc.tempDesc = addNews1[indexPath.row].ShortDescription
            vc.tempFull = addNews1[indexPath.row].LongDescription
            vc.tempImage = addNews1[indexPath.row].imageName
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "NewsDetailsViewController")
            as! NewsDetailsViewController

            vc.tempTitle = addNews1[indexPath.row].title
            vc.tempDesc = addNews1[indexPath.row].ShortDescription
            vc.tempFull = addNews1[indexPath.row].LongDescription
            vc.tempImage = addNews1[indexPath.row].imageName
            self.navigationController?.pushViewController(vc, animated: true)
        }



    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0:
            return 1
        default:
            return addNews1.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        switch indexPath.section
        {
        case 0:
            let cell3 = tableView.dequeueReusableCell(withIdentifier: "JustForYouTableViewCell", for: indexPath) as! JustForYouTableViewCell
            cell3.detailsTapped2 = {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(identifier: "NewsDetailsViewController")
                as! NewsDetailsViewController
                vc.tempTitle = addNews1[indexPath.row].title
                vc.tempDesc = addNews1[indexPath.row].ShortDescription
                vc.tempFull = addNews1[indexPath.row].LongDescription
                vc.tempImage = addNews1[indexPath.row].imageName
                self.navigationController?.pushViewController(vc, animated: true)
            }
            cell3.clouser = { (item)
                in let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(identifier: "NewsDetailsViewController")
                as! NewsDetailsViewController
                vc.tempTitle = addNews1[item].title
                vc.tempDesc = addNews1[item].ShortDescription
                vc.tempFull = addNews1[item].LongDescription
                vc.tempImage = addNews1[item].imageName
                self.navigationController?.pushViewController(vc, animated: true)
            }
            cell3.justReload()
           return cell3
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
            cell.newsTitle.text = addNews1[indexPath.row].title
            cell.newsDescription.text = addNews1[indexPath.row].ShortDescription
            cell.newsimageView.image = addNews1[indexPath.row].imageName
            cell.buttonPressedClosure = { flag in

            }
           return cell
           
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section{
        case 0:
            return 300
        default:
            return 150
        }
        }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
         let view = UIView()
         let label = UILabel()

         if(section == 0)
         {

             label.text = sections[section]
             view.addSubview(label)

             label.translatesAutoresizingMaskIntoConstraints = false

             let views = ["label": label,"view": view]

             let horizontallayoutContraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[label]|", options: .alignAllCenterY, metrics: nil, views: views)
             view.addConstraints(horizontallayoutContraints)

             let verticalLayoutContraint = NSLayoutConstraint(item: label, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 0.3, constant: 0)
             view.addConstraint(verticalLayoutContraint)

         }
         else
         {
             label.text = sections[section]

             view.addSubview(label)

             label.translatesAutoresizingMaskIntoConstraints = false

             let views = ["label": label, "view": view]
             let horizontallayoutContraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[label]|", options: .alignAllCenterY, metrics: nil, views: views)
             view.addConstraints(horizontallayoutContraints)

             let verticalLayoutContraint = NSLayoutConstraint(item: label, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 0.3, constant: 0)
             view.addConstraint(verticalLayoutContraint)



         }
     return view
            }
            @objc func buttonTapped(sender : UIButton) {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(identifier: "SeeMoreViewController")
                self.navigationController?.pushViewController(vc, animated: true)
            }
            @objc func buttonTapped2(sender : UIButton) {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(identifier: "JustForYouSeeMoreViewController")
                self.navigationController?.pushViewController(vc, animated: true)
            }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    
}

