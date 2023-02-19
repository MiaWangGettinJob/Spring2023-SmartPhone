//
//  ViewController.swift
//  FoodMenu
//
//  Created by Simiao Wang on 2/18/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    let imageNames = ["Burger", "Tangyuan","Dumplings","Pizza","Ice cream","Salad"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self)?.first as! TableViewCell
        //cell.ImageContainer.image = UIImage(named: "Food\(indexPath.row)")
        //cell.Label.text = "Food\(indexPath.row)"
        cell.ImageContainer.image = UIImage(named: imageNames[indexPath.row])
        cell.Label.text = imageNames[indexPath.row]
        
        //cell.ImageContainer.image = UIImage(named: "Burger")
        return cell
    }
    


}

