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
    override func viewDidLoad() {
        self.descriptionlabel.text = d
        super.viewDidLoad()
        self.navigationItem.title = name
        tableView.dataSource = self
        tableView.delegate = self
        let url = URL(string: "http://45.56.103.124/exams")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                 self.exams = dataDictionary[self.name] as! [String : [String:[String:Any]]]
                 self.tableView.reloadData()

                    // TODO: Get the array of movies
                    // TODO: Store the movies in a property to use elsewhere
                    // TODO: Reload your table view data

             }
        }
        task.resume()
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exams.count    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dateCell") as! dateCell
        let date = Array(exams.keys)[indexPath.row] as! String
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
        let date = Array(exams.keys)[indexPath.row] as! String
        let e = exams[date]
        let detailsViewController = segue.destination as! MoredetailedController
        detailsViewController.exams = e!
        detailsViewController.date = date
        detailsViewController.name = self.name
        tableView.deselectRow(at: indexPath, animated: true)
    }
    

}
