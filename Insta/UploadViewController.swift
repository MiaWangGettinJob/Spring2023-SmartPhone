//
//  UploadViewController.swift
//  Insta
//
//  Created by Simiao Wang on 4/20/23.
//

import UIKit
import CoreLocation
import RealmSwift

class UploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, CLLocationManagerDelegate {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var txtTitle: UITextField!
    var uploadProtocol: UploadImageProtocol?
    
    @IBOutlet weak var uploadAction: UIButton!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func takeAPicAction(_ sender: Any) {
        let actionSheet = UIAlertController(title: "Take a picture", message: "Something", preferredStyle: .alert)
        
        let cameraAction = UIAlertAction(title: "Camera", style: .default){
            action in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                            let imagePicker = UIImagePickerController()
                            imagePicker.delegate = self
                            imagePicker.sourceType = .camera
                            imagePicker.allowsEditing = false
                            self.present(imagePicker, animated: true)
                        }
        }
        let photoLibAction = UIAlertAction(title: "Photo Library", style: .default){
            action in
            
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                            let imagePicker = UIImagePickerController()
                            imagePicker.delegate = self
                            imagePicker.sourceType = .photoLibrary
                            imagePicker.allowsEditing = false
                            self.present(imagePicker, animated: true)
                        }
            
        }
        let cancel = UIAlertAction(title: " Cancel", style: .cancel){
                action in print("Cancel")
        }
        
            actionSheet.addAction(cameraAction)
            actionSheet.addAction(photoLibAction)
            actionSheet.addAction(cancel)
            
            self.present(actionSheet, animated:  true)
    }
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                imgView.image = image
                
            }
            
            picker.dismiss(animated: true)
            
        }
        
        
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let location = locations.last else { return }
            
        
         //   let lat = location.coordinate.latitude
          //  let lng = location.coordinate.longitude
            
          
            getAddressFromLocation(location: location)
            
        }
    func getAddressFromLocation( location: CLLocation){
            
            let clGeoCoder = CLGeocoder()
            
            clGeoCoder.reverseGeocodeLocation(location) { placeMarks, error in
                
                if error != nil {
                    print(error?.localizedDescription)
                    return
                }
                var address = ""
                guard let place = placeMarks?.first else { return }
                
                if place.name != nil {
                    address += place.name! +  ", "
                }
                
                if place.locality != nil {
                    address += place.locality! +  ", "
                }
                if place.subLocality != nil {
                    address += place.subLocality! +  ", "
                }
                
                if place.postalCode != nil {
                    address += place.postalCode! +  ", "
                }
                
                if place.country != nil {
                    address += place.country!
                }
                
                self.lblLocation.text = address
                
            }
        }
    
    @IBAction func getLocation(_ sender: Any) {
        locationManager.requestLocation()
    }
    
    
    @IBAction func uploadAction(_ sender: Any) {
        
        
        guard let img = imgView.image else {return}
        guard let location = lblLocation.text else {return}
        guard let title = txtTitle.text else {return}
        
        
        //Add to Realm
        let realm = try! Realm()
        let photo: Data? = img.pngData()
        let photoexample: PhotoCombo = PhotoCombo()
        photoexample.imageDB = photo
        photoexample.locationDB = location
        photoexample.titleDB = title
        
        do {
            try realm.write {
                realm.add(photoexample, update: .modified)
            }
        } catch let error as NSError {
            print("Unable to add values to the DB" + error.localizedDescription)
        }
                
        uploadProtocol?.uploadedImageDelegate(img: img, locationImg: location, titleImg: title)
        
        self.tabBarController?.selectedIndex = 0

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
