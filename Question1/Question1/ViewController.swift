//
//  ViewController.swift
//  Question1
//
//  Created by Simiao Wang on 3/18/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var indexpath = IndexPath()
    let arr = ["Christ the Redeemer", "Colosseum", "Giza Pyramids", "Great Wall of China", "Machu Picchu", "Petra", "Taj Mahal"]
    
    let details = ["Christ the Redeemer (Portuguese: Cristo Redentor, standard Brazilian Portuguese: [ˈkɾistu ʁedẽˈtoʁ], local pronunciation: [ˈkɾiɕtŭ̥ xe̞dẽˈtoɦ]) is an Art Deco statue of Jesus Christ in Rio de Janeiro, Brazil, created by French sculptor Paul Landowski and built by Brazilian engineer Heitor da Silva Costa, in collaboration with French engineer Albert Caquot. Romanian sculptor Gheorghe Leonida sculpted the face. Constructed between 1922 and 1931, the statue is 30 metres (98 ft) high, excluding its 8-metre (26 ft) pedestal. The arms stretch 28 metres (92 ft) wide.[1][2] It is made of reinforced concrete and soapstone.[3][4][5] Christ the Redeemer differs considerably from its original design, as the initial plan was a large Christ with a globe in one hand and a cross in the other. Although the project organisers originally accepted the design, it later changed to the statue of today, with the arms spread out wide.", "Colosseum", "Giza Pyramids", "Great Wall of China", "Machu Picchu", "Petra", "Taj Mahal"]
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
        cell.Label.text = arr[indexPath.row]
        
        //cell.ImageContainer.image = UIImage(named: "Burger")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segueDetails", sender: self)
        self.indexpath = indexPath
        
        
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueDetails" {
            let secondVC = segue.destination as! DetailViewController
            let indexpath =  self.indexpath
            secondVC.detail = self.details[indexpath.row]
//
        }
        
    }
    
}
