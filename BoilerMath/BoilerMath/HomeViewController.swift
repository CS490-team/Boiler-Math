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
    var namelist = [String]()
    var dataDictionary2 = [String: Any]()
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
                 self.namelist = Array(self.courses.keys)
                 self.namelist.sort()
                 self.tableView.reloadData()
                    // TODO: Get the array of movies
                    // TODO: Store the movies in a property to use elsewhere
                    // TODO: Reload your table view data

             }
        }
        task.resume()
        
        let url2 = URL(string: "http://45.56.103.124/exams")!
        let request2 = URLRequest(url: url2, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session2 = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task2 = session2.dataTask(with: request2) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                 self.dataDictionary2 = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]

             }
        }
        task2.resume()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "courseCell") as! courseCell
        

        
        let name = namelist[indexPath.row] as! String
        
        if name == "MA16100" {
            let imageView = UIImageView(frame: CGRect(x: 5, y: 5, width: cell.frame.width - 10, height: cell.frame.height - 5))
            let image = UIImage(named: "1.jpeg")
            imageView.image = image
            cell.backgroundView = UIView()
            cell.backgroundView!.addSubview(imageView)
        }
        
        if name == "MA16200" {
            let imageView = UIImageView(frame: CGRect(x: 5, y: 5, width: cell.frame.width - 10, height: cell.frame.height - 5))
            let image = UIImage(named: "7.jpeg")
            imageView.image = image
            cell.backgroundView = UIView()
            cell.backgroundView!.addSubview(imageView)
        }
        
        if name == "MA16500" {
            let imageView = UIImageView(frame: CGRect(x: 5, y: 5, width: cell.frame.width - 10, height: cell.frame.height - 5))
            let image = UIImage(named: "3.jpeg")
            imageView.image = image
            cell.backgroundView = UIView()
            cell.backgroundView!.addSubview(imageView)
        }
        
        if name == "MA16600" {
            let imageView = UIImageView(frame: CGRect(x: 5, y: 5, width: cell.frame.width - 10, height: cell.frame.height - 5))
            let image = UIImage(named: "4.jpeg")
            imageView.image = image
            cell.backgroundView = UIView()
            cell.backgroundView!.addSubview(imageView)
        }
        
        if name == "MA26100" {
            let imageView = UIImageView(frame: CGRect(x: 5, y: 5, width: cell.frame.width - 10, height: cell.frame.height - 5))
            let image = UIImage(named: "5.jpeg")
            imageView.image = image
            cell.backgroundView = UIView()
            cell.backgroundView!.addSubview(imageView)
        }
        
        if name == "MA26200" {
            let imageView = UIImageView(frame: CGRect(x: 5, y: 5, width: cell.frame.width - 10, height: cell.frame.height - 5))
            let image = UIImage(named: "6.jpeg")
            imageView.image = image
            cell.backgroundView = UIView()
            cell.backgroundView!.addSubview(imageView)
        }
        
        if name == "MA26500" {
            let imageView = UIImageView(frame: CGRect(x: 5, y: 5, width: cell.frame.width - 10, height: cell.frame.height - 5))
            let image = UIImage(named: "2.jpeg")
            imageView.image = image
            cell.backgroundView = UIView()
            cell.backgroundView!.addSubview(imageView)
        }
        
        if name == "MA26600" {
            let imageView = UIImageView(frame: CGRect(x: 5, y: 5, width: cell.frame.width - 10, height: cell.frame.height - 5))
            let image = UIImage(named: "8.jpeg")
            imageView.image = image
            cell.backgroundView = UIView()
            cell.backgroundView!.addSubview(imageView)
        }

        
        let description = courses[name]
        cell.CourseNameLabel.text = name
//        cell.CourseDescriptionLabel.text = description

        return cell
    }


    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)!
        let name = namelist[indexPath.row] as! String
        let description = courses[name]
        let detailsViewController = segue.destination as! coueseDetailsViewController
        let dd = dataDictionary2
//        detailsViewController.navigationController?.navigationBar.topItem?.title = name
        detailsViewController.name = name
        detailsViewController.d = description
        detailsViewController.dd = dd
        tableView.deselectRow(at: indexPath, animated: true)


    }
    

}
