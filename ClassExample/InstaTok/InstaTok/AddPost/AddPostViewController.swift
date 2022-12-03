//
//  AddPostViewController.swift
//  InstaTok
//
//  Created by 冯哲宁 on 11/12/22.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore


class AddPostViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var txtCaption: UITextField!
    
    var db: Firestore?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func postAction(_ sender: Any) {
        guard let caption = txtCaption.text else {return}
        
        let imageURL = "Some Image Url"
        let timestamp = NSDate().timeIntervalSince1970
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        guard let db = db else {return}
        let path = "Posts"
        
    }
    @IBAction func selectImage(_ sender: Any) {
    }
}
