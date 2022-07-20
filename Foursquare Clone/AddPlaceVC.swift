//
//  AddPlaceVC.swift
//  Foursquare Clone
//
//  Created by Berkay on 18.07.2022.
//

import UIKit

class AddPlaceVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var placeNameText: UITextField!
    @IBOutlet weak var placeTypeText: UITextField!
    @IBOutlet weak var placeAtmosphereText: UITextField!
    @IBOutlet weak var placeImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        placeImageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(chooseImage))
        placeImageView.addGestureRecognizer(gestureRecognizer)
    }

    @IBAction func nextButtonClicked(_ sender: Any) {
        // Segue
        
        if placeNameText.text != "" && placeTypeText.text != "" && placeAtmosphereText.text != "" {
            if let chooseImage = placeImageView.image {
                let placeModel = PlaceModel.sharedInstance
                placeModel.placeName = placeNameText.text!
                placeModel.placeType = placeTypeText.text!
                placeModel.placeAtmosphere = placeAtmosphereText.text!
                placeModel.placeImage = chooseImage
            }
            self.performSegue(withIdentifier: "toMapVC", sender: nil)
        }else {
            let alet = UIAlertController(title: "Error", message: "Cannot be empty", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "Ok", style: .default)
            alet.addAction(okButton)
            present(alet, animated: true)
        }
    }
    
    @objc func chooseImage() {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        self.present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        placeImageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true)
    }
    
}
