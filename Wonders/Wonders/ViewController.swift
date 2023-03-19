//
//  ViewController.swift
//  Wonders
//
//  Created by Simiao Wang on 3/18/23.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    let arr = ["Christ the Redeemer", "Colosseum", "Giza Pyramids", "Great Wall of China", "Machu Picchu", "Petra", "Taj Mahal"]
    
    var index = 0
    @IBOutlet weak var tblView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self)?.first as! TableViewCell
        
        cell.ImageViewContainer.image = UIImage(named: arr[indexPath.row])
        cell.lblName.text = arr[indexPath.row]
        
        //cell.ImageContainer.image = UIImage(named: "Burger")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // when click the picture
        let imageClicked = arr[indexPath.row]
        index = indexPath.row
        
        performSegue(withIdentifier: "segueDetails", sender: "self")
    }
    
    // before perform the segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueDetails" {
            let secondVC = segue.destination as! DetailViewController
            
            secondVC.index = index
        }
        
    }
    
}
