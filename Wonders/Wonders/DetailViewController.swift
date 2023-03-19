//
//  DetailViewController.swift
//  Wonders
//
//  Created by Simiao Wang on 3/18/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var txtDetail: UITextView!
    var index = 0
        
        var details = ["Christ the Redeemer (Portuguese: Cristo Redentor, standard Brazilian Portuguese: [ˈkɾistu ʁedẽˈtoʁ], local pronunciation: [ˈkɾiɕtŭ̥ xe̞dẽˈtoɦ]) is an Art Deco statue of Jesus Christ in Rio de Janeiro, Brazil, created by French sculptor Paul Landowski and built by Brazilian engineer Heitor da Silva Costa, in collaboration with French engineer Albert Caquot. Romanian sculptor Gheorghe Leonida sculpted the face. Constructed between 1922 and 1931, the statue is 30 metres (98 ft) high, excluding its 8-metre (26 ft) pedestal. The arms stretch 28 metres (92 ft) wide.[1][2] It is made of reinforced concrete and soapstone.[3][4][5] Christ the Redeemer differs considerably from its original design, as the initial plan was a large Christ with a globe in one hand and a cross in the other. Although the project organisers originally accepted the design, it later changed to the statue of today, with the arms spread out wide.", "Colosseum", "Giza Pyramids", "Great Wall of China", "Machu Picchu", "Petra", "Taj Mahal"]
        

    override func viewDidLoad() {
        super.viewDidLoad()
        txtDetail.text = details[index]

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
