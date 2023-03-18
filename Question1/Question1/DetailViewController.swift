//
//  DetailViewController.swift
//  Question1
//
//  Created by Simiao Wang on 3/18/23.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var lbldetails: UILabel!
    var detail = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        lbldetails.text = detail
        // Do any additional setup after loading the view.
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
