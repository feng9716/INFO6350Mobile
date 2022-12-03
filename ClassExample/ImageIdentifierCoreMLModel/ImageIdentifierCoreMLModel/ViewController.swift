//
//  ViewController.swift
//  ImageIdentifierCoreMLModel
//
//  Created by 冯哲宁 on 12/3/22.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var lableObject: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    let mlModel = MobileNetV2().model
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func TakeAPicture(_ sender: Any) {
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
            predictObject(image: image)
        }
        
        picker.dismiss(animated: true)
        
    }
    
    func predictObject(image : UIImage){
        guard let ciimage = CIImage(image: image) else {return}
        
        guard let model = try? VNCoreMLModel(for: self.mlModel) else {return}
        
        let request = VNCoreMLRequest(model: model) {
            (response, error) in
            if(error != nil){
                print("Error when predictin model")
                return
            }
            
            guard let result = response.results as? [VNClassificationObservation] else {return}
            
            print(result)
            if let firstPrediction = result.first {
                self.lableObject.text = firstPrediction.identifier
            }
        }
        
        let handler = VNImageRequestHandler(ciImage: ciimage)
        do {
            try handler.perform([request])
        }catch{
            print(error)
        }
    }
    
}

