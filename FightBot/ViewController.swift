//
//  ViewController.swift
//  FightBot
//
//  Created by Akhil on 10/14/17.
//  Copyright © 2017 Akhil. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ViewController: UIViewController {

    //var databaseHandle: DatabaseHandle?
    //var postData = [String()]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //fetchData()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }

    @IBAction func PlaceOrderButtonPressed(_ sender: Any) {
        
        performSegue(withIdentifier: "placeOrder", sender: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    func fetchData()
//    {
//        var ref: DatabaseReference!
//        
//        ref = Database.database().reference()
//        databaseHandle = ref?.child("user").observe(.childAdded, with: {(snapshot)in
//            self.postData.append("")
//        
//        })
    
    


}

