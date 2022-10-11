//
//  ViewController.swift
//  NEWSAPP
//
//  Created by Rishabh Sharma on 14/03/22.
//

import UIKit
var sectionArr = [StringConstant.section1.rawValue , StringConstant.section2.rawValue]
class NewsAppViewController: UIViewController {

    @IBOutlet weak var grettingLable: UILabel!
    @IBOutlet var headerView: UIView!
    @IBOutlet weak var tableView: UITableView!
    var sections = ["Just for you" , "News"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        grettingLable.text = gretting() + ", " + StringConstant.userName.rawValue
        tableView.delegate = self
        tableView.dataSource = self
        setupTableView()
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
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
extension ViewController : UITableViewDelegate, UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        switch indexPath.section
        {
        case 0:
            let cell3 = tableView.dequeueReusableCell(withIdentifier: "JustForYouTableViewCell", for: indexPath) as! JustForYouTableViewCell
            cell3.justReload()
           return cell3
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
                cell.seeMoreButtonTapped2 = {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(identifier: "SeeMoreViewController")
                self.navigationController?.pushViewController(vc, animated: true)
            }
            cell.detailsTapped2 = {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(identifier: "NewsDetailsViewController")
                as! NewsDetailsViewController
                vc.tempTitle = addNews1[indexPath.row].title
                vc.tempDesc = addNews1[indexPath.row].ShortDescription
                vc.tempFull = addNews1[indexPath.row].LongDescription
                vc.tempImage = addNews1[indexPath.row].imageName
                self.navigationController?.pushViewController(vc, animated: true)
            }
            cell.justReload()
           return cell
           
    }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 300
        }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: 350, height: 20))
                let label = UILabel(frame: CGRect(x: 20, y: 0, width: 100, height: 20))
                label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
                label.text = sections[section]
                label.textColor = .gray
                headerView.addSubview(label)
                let button = UIButton(frame: CGRect(x: 305, y: 0, width: 60, height: 15))
                button.setTitle("See All", for: .normal)
                button.backgroundColor = .white
                button.titleLabel?.font =  UIFont(name: "HelveticaNeue" , size: 15)
                button.setTitleColor(UIColor.blue, for: .normal)
                button.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
                headerView.addSubview(button)
                return headerView
            }
            @objc func buttonTapped(sender : UIButton) {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(identifier: "SeeMoreViewController")
                self.navigationController?.pushViewController(vc, animated: true)
            }
    
}

