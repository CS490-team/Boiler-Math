//
//  CameraViewController.swift
//  BoilerMath
//
//  Created by user215336 on 4/15/22.
//

import UIKit
import AlamofireImage
import Parse
class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBAction func onSubmit(_ sender: Any) {
        let post = PFObject(className: "Posts")
        post["caption"] = commentField.text!
        post["title"] = postTitle.text!
        post["Author"] = PFUser.current()!
        post["topic"] = topicField.text!
        let imageData = ImageView.image!.pngData()
        let file = PFFileObject( data: imageData!)
        post["image"] = file
        
        post.saveInBackground{
         (success, error) in
            if success {
                self.dismiss(animated: true, completion: nil)
                print("success")
            } else {
                print("error")
            }
        }
        
        
    }
    
 
    @IBOutlet weak var topicField: UITextField!
    @IBOutlet weak var postTitle: UITextField!
    @IBOutlet weak var commentField: UITextField!
    @IBOutlet weak var ImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onCamera(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
        } else {
            picker.sourceType = .photoLibrary
        }
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        let size = CGSize(width: 300, height: 300)
        let scaledImage = image.af.imageAspectScaled(toFill: size)
        ImageView.image = scaledImage
        dismiss(animated: true, completion: nil)
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
