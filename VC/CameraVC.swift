//
//  CameraVC.swift
//  TestTaskiOSDeveloperITRexGroup
//
//  Created by 1 on 21.03.2018.
//  Copyright © 2018 ANDRE.CORP. All rights reserved.
//

import UIKit
import CoreLocation
import AVFoundation

class CameraVC: UIViewController {

    @IBOutlet weak var imageCamera: UIImageView!
    let pickerController = UIImagePickerController()
    var locationManager = CLLocationManager()
    var img = UIImage()
    var photo: Photo!
    
    
    // MARK: - VDL
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerControllerDelegate()
        locationManagers()
    }
    
    
    
   
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "savePhoto" {
            let destVC = segue.destination as! Gallery
            makePhotoClass()
            if photo != nil {
                destVC.newPhoto = photo
            }
        }
    }
    
    @IBAction func makePhoto(_ sender: UIButton) {
        self.present(pickerController, animated: true, completion: nil)
    }
    
    @IBAction func savePhoto(_ sender: UIButton) {
        makePhotoClass()
    }
    
    func makePhotoClass() {
        let lat = locationManager.location?.coordinate.latitude
        let long = locationManager.location?.coordinate.longitude
        let data = UIImageJPEGRepresentation(img, 2.0)
        
        if data != nil && lat != nil && long != nil {
            let newPhoto = Photo(photo: "Photo", lat: lat!, long: long!, imageData: data! as NSData)
            photo = newPhoto
        }
    }
    
}



// MARK: - extension for PickerController and LocationDelegate
extension CameraVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate, CLLocationManagerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        img = (info[UIImagePickerControllerOriginalImage] as? UIImage)!
        img.withHorizontallyFlippedOrientation()
        imageCamera.image = img
    }
    
    func pickerControllerDelegate () {
        pickerController.delegate = self
        pickerController.sourceType = UIImagePickerControllerSourceType.camera
    }
    
    func locationManagers() {
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
    }
}



