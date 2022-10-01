//
//  ViewController.swift
//  TakeAPicture
//
//  Created by 冯哲宁 on 10/1/22.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var imgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func takePicture(_ sender:Any){
        let alertController = UIAlertController(title: "Take a picture", message: "Awesome", preferredStyle: .alert)
        
        let cameraAction = UIAlertAction(title: "Camera", style: .default){
            action in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = .camera
                imagePicker.allowsEditing = false
                self.present(imagePicker, animated: true)
            }
            print("Camera pressed")
        }
        
        let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default){action in
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = .photoLibrary
                imagePicker.allowsEditing = false
                self.present(imagePicker, animated: true)
            }
            print("Photo Library pressed")
        }
        
        let CancelAction = UIAlertAction(title: "Cancel", style: .default){action in
            print("Cancel pressed")
        }
        
        alertController.addAction(cameraAction)
        alertController.addAction(photoLibraryAction)
        alertController.addAction(CancelAction)
        
        self.present(alertController, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            imgView.image = image
        }
        
        picker.dismiss(animated: true)
        
    }
}

