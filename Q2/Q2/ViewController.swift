//
//  ViewController.swift
//  Q2
//
//  Created by Simiao Wang on 3/18/23.
//

import UIKit
import SwiftSpinner
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var txtStockSymbol: UITextField!
    
    
    @IBOutlet weak var txtcn: UILabel!
    
    @IBOutlet weak var lblPrice: UILabel!
    
    @IBOutlet weak var lblWeb: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getStockPro(_ sender: Any) {
        guard let symbol = txtStockSymbol.text else {return}
                
                let url = "\(baseURL)\(symbol)?apikey=\(apiKey)"
                
                SwiftSpinner.show("Getting Stock Profile for \(symbol)")
                
                AF.request(url).responseJSON { response in
                    SwiftSpinner.hide()
                    if response.error != nil {
                        print("Error in response")
                        return
                    }
                    guard let rawData = response.data else {return}
                    guard let jsonArray = JSON(rawData).array else {return}
                    guard let stock = jsonArray.first else {return}
                    let comName = stock["companyName"].stringValue
                    let price = stock["price"].doubleValue
                    let web = stock["website"].stringValue
                    
                    self.txtcn.text = "Company Name =  \(comName)"
                    self.lblPrice.text = "Price = \(price) $"
                    self.lblWeb.text = "Website = \(web) "

                }
    }
    
}

