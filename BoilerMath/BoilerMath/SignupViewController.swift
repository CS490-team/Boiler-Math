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
    
    @IBAction func backLogin(_ sender: Any) {
        self.performSegue(withIdentifier: "signupSegue", sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

        // Do any additional setup after loading the view.
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    @IBAction func Signup(_ sender: Any) {
        if ((confirmPassword.text == "") || (passwordField.text == "") || (usernameField.text == "")) {
            let alert = UIAlertController(title: "Error", message: "Empty text field, please try again", preferredStyle: .alert)
                    let OK = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alert.addAction(OK)
                    self.present(alert, animated: true, completion: nil)
        } else {
            if (confirmPassword.text == passwordField.text && (confirmPassword.text != nil) && (passwordField.text != nil)) {
                var user = PFUser()
                user.username = usernameField.text
                user.password = passwordField.text
                user.signUpInBackground { (success, error) in
                    if success {
                        self.performSegue(withIdentifier: "signupSegue", sender: nil)
                    } else {
                        let alert = UIAlertController(title: "Error", message: "Existing user name, please try with a different user name", preferredStyle: .alert)
                                let OK = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                                alert.addAction(OK)
                                self.present(alert, animated: true, completion: nil)
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
