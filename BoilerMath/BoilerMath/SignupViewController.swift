//
//  SignupViewController.swift
//  BoilerMath
//
//  Created by 安益廷 on 4/1/22.
//

import UIKit
import Parse

class SignupViewController: UIViewController {
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Signup(_ sender: Any) {
        if (confirmPassword.text == passwordField.text && (confirmPassword.text != nil) && (passwordField.text != nil)) {
            var user = PFUser()
            user.username = usernameField.text
            user.password = passwordField.text
            user.signUpInBackground { (success, error) in
                if success {
                    self.performSegue(withIdentifier: "signupSegue", sender: nil)
                } else {
                    print("Error: \(error?.localizedDescription)")
                }
            }
        } else {
            let alert = UIAlertController(title: "Error", message: "Password does not match, please try again", preferredStyle: .alert)
                    let OK = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alert.addAction(OK)
                    self.present(alert, animated: true, completion: nil)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
