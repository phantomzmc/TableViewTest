//
//  ViewController.swift
//  TableViewTest
//
//  Created by Thannathrn Yuwasin on 7/14/2560 BE.
//  Copyright © 2560 Thannathrn Yuwasin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    var items: [String] = ["We", "Heart", "Swift"]

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        //tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return items.count
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell:CellTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CellTableViewCell
            cell.titleLabel?.text = items[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "gotoSubView", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "gotoSubView") {
            let subviewController:SubViewController = segue.destination as! SubViewController
            var indexPath:IndexPath = sender as! IndexPath
            subviewController.data = items[indexPath.row]
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func unwindgotoSubView(segue: UIStoryboardSegue) {
    }


}

