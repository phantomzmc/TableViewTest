//
//  SubViewController.swift
//  TableViewTest
//
//  Created by Thannathrn Yuwasin on 7/14/2560 BE.
//  Copyright © 2560 Thannathrn Yuwasin. All rights reserved.
//

import UIKit
import Kingfisher

class SubViewController: UIViewController {
    
    //var data:String = ""
    var person:Person!

    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var datailLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var lastnameLabel: UILabel!
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataLabel.text = person.firstname
        lastnameLabel.text = person.lastname
        ageLabel.text = "\(person.age!)"
        datailLabel.text = person.detail
        // Do any additional setup after loading the view.
        
        if let photoUrl = person?.photoUrl {
            photoImageView.kf.setImage(with: URL(string:photoUrl))
        }else{
            photoImageView.image = UIImage(named: "feu")
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func backTap(_ sender: Any) {
        performSegue(withIdentifier: "backToViewController", sender: self)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
