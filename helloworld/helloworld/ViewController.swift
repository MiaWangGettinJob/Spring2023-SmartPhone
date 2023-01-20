//
//  ViewController.swift
//  helloworld
//
//  Created by Simiao Wang on 1/20/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblExample: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func pressmeaction(_ sender: UIButton) {
        print("Button was pressed")
        lblExample.text = "Hello World"
    }
}

