//
//  ViewController.swift
//  Resturants
//
//  Created by Simiao Wang on 2/16/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var tblViewTop: UITableView!
    
    @IBOutlet weak var tblViewBottom: UITableView!
    let resturants = ["Zaika","Hot Pot", "Zeeks Pizza", "Roti","Zaika","Hot Pot", "Zeeks Pizza", "Roti","Zaika","Hot Pot", "Zeeks Pizza", "Roti","Zaika","Hot Pot", "Zeeks Pizza", "Roti",]
    let food = ["Food1","Food 2", "Food 3"]

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           if tableView == tblViewTop {
               return resturants.count
           }else{
               return food.count
           }
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
           if tableView == tblViewTop {
               let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
               cell.textLabel?.text = resturants[indexPath.row]
               return cell
               
           }else{
               let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
               cell.textLabel?.text = food[indexPath.row]
               return cell
           }
       }
    /* func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView == tblViewTop {
        
        }else{
            let chosen = indexPath.row
            return food[chosen]
        }
     */
        
        
    }

    
    
    

