//
//  HomeViewController.swift
//  BoilerMath
//
//  Created by 安益廷 on 3/31/22.
//

import UIKit
import Parse
class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func logout(_ sender: Any) {
        PFUser.logOut()
        let main = UIStoryboard(name: "Main", bundle: nil)
        let LoginViewController = main.instantiateViewController(withIdentifier: "LoginViewController")
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScene.delegate as? SceneDelegate else {return}
        
        delegate.window?.rootViewController = LoginViewController
    }
    var courses = [String:String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        let url = URL(string: "http://45.56.103.124/descriptions")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: String]
                 self.courses = dataDictionary
                 self.tableView.reloadData()
                    // TODO: Get the array of movies
                    // TODO: Store the movies in a property to use elsewhere
                    // TODO: Reload your table view data

             }
        }
        task.resume()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "courseCell") as! courseCell
        let name = Array(courses.keys)[indexPath.row] as! String
        let description = courses[name]
        cell.CourseNameLabel.text = name
        cell.CourseDescriptionLabel.text = description
        return cell
    }


    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)!
        let name = Array(courses.keys)[indexPath.row] as! String
        let description = courses[name]
        let detailsViewController = segue.destination as! coueseDetailsViewController
//        detailsViewController.navigationController?.navigationBar.topItem?.title = name
        detailsViewController.name = name
        detailsViewController.d = description
        tableView.deselectRow(at: indexPath, animated: true)


    }
    

}
