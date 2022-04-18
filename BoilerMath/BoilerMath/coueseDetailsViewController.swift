//
//  coueseDetailsViewController.swift
//  BoilerMath
//
//  Created by 吴承翔 on 4/10/22.
//

import UIKit

class coueseDetailsViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var descriptionlabel: UILabel!
    var name:String!
    var exams = [String:[String:[String:Any]]]()
    var d:String!
    var dd = [String: Any]()
    var examlist = [String]()
    override func viewDidLoad() {
        self.descriptionlabel.text = d
        super.viewDidLoad()
        self.navigationItem.title = name
        tableView.dataSource = self
        tableView.delegate = self
        let dataDictionary = dd
        
        if (!dataDictionary.isEmpty) {
            self.exams = dataDictionary[self.name] as! [String : [String:[String:Any]]]
            self.examlist = Array(self.exams.keys)
            self.examlist.sort()
            self.tableView.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exams.count    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dateCell") as! dateCell
        let date = self.examlist[indexPath.row] as! String
        print(date)
        cell.dateLabel.text = date
        return cell
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)!
        let date = self.examlist[indexPath.row] as! String
        let e = exams[date]
        let detailsViewController = segue.destination as! MoredetailedController
        detailsViewController.exams = e!
        detailsViewController.date = date
        detailsViewController.name = self.name
        tableView.deselectRow(at: indexPath, animated: true)
    }
    

}
