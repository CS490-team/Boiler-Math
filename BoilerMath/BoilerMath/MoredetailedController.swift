//
//  MoredetailedController.swift
//  BoilerMath
//
//  Created by 吴承翔 on 4/10/22.
//

import UIKit

class MoredetailedController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var date:String!
    var exams = [String:[String:Any]]()
    var name:String!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.reloadData()
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exams.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "examCell") as! examCell
        cell.examdate.text = self.date
        cell.examname.text = self.name
        let version = Array(exams.keys)[indexPath.row] as! String
        cell.examversion.text = version
        cell.version = exams[version]!
        cell.contoller = self
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)!
        let version = Array(exams.keys)[indexPath.row] as! String
        let e = exams[version]
        let detailsViewController = segue.destination as! examCell
        detailsViewController.version = e!
        tableView.deselectRow(at: indexPath, animated: true)
    }
    */
    

}
