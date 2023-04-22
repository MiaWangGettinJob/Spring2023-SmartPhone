//
//  HomeViewController.swift
//  Insta
//
//  Created by Simiao Wang on 4/20/23.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UploadImageProtocol {
    
    
    
    @IBOutlet weak var tblView: UITableView!
    
    var images : [UIImage] = [UIImage]()
    var locations:[String] = [String]()
    var imageTitles:[String] = [String]()
    
    var uploadImageVC : UIViewController?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let controller = navigationController?.tabBarController
        uploadImageVC = navigationController?.tabBarController?.viewControllers?[0]
        print(uploadImageVC?.title)
        
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        imageTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self)?.first as! TableViewCell
        cell.lblName.text = imageTitles[indexPath.row]
        cell.lblLocation.text = locations[indexPath.row]
        cell.ImageViewContainer.image = images[indexPath.row]
        
        return cell
    }
    
    
    func uploadedImageDelegate(img: UIImage, locationImg: String, titleImg: String) {
        images.append(img)
        locations.append(locationImg)
        imageTitles.append(titleImg)
        
        
        tblView.reloadData()
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    }
}
