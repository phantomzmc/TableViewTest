//
//  SubViewController.swift
//  TableViewTest
//
//  Created by Thannathrn Yuwasin on 7/14/2560 BE.
//  Copyright © 2560 Thannathrn Yuwasin. All rights reserved.
//

import UIKit

class SubViewController: UIViewController {
    
    var data:String = ""

    @IBOutlet weak var dataLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataLabel.text = data
        // Do any additional setup after loading the view.
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
