//
//  ViewController.swift
//  TableViewTest
//
//  Created by Thannathrn Yuwasin on 7/14/2560 BE.
//  Copyright © 2560 Thannathrn Yuwasin. All rights reserved.
//

import UIKit
import Kingfisher
import Alamofire
//http://www.mocky.io/v2/5969b2a4110000e00101ccee

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    var persons: [Person?] = []

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var userImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request("http://www.mocky.io/v2/5969b2a4110000e00101ccee").responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
                
                let dict:NSDictionary = json as! NSDictionary
                
                let personsArray = dict.object(forKey: "person") as! NSArray
                
                for personJson in personsArray {
                    let personDict = personJson as! NSDictionary
                    let person:Person = Person(json: personDict)
                    self.persons.append(person)
                }
                self.tableView.reloadData()
                
            }
        }
        
//        let person:Person = Person(firstname: "Thunnathorn", lastname: "Yuvasin", age: 21,
//                                   photoUrl: "https://avatars5.githubusercontent.com/u/12868717?v=4&s=460")
//        persons.append(person)
//        let person2:Person = Person(firstname: "Jitana", lastname: "Singjit", age: 20)
//        persons.append(person2)
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return persons.count
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell:CellTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CellTableViewCell
        
        let person = persons[indexPath.row]
        if let firstname = person?.firstname {
            cell.titleLabel.text = firstname
        }else{
            cell.titleLabel.text = "-"
        }
        if let userImageView = person?.photoUrl {
            cell.userImageView.kf.setImage(with: URL(string:userImageView))
        }else{
            cell.userImageView.image = UIImage(named: "feu")
        }
        
        
        
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
            subviewController.person = persons[indexPath.row]
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func unwindgotoSubView(segue: UIStoryboardSegue) {
    }


}

