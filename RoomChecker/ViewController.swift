//
//  ViewController.swift
//  RoomChecker
//
//  Created by NAUVAL ADIYASA on 4/05/2017.
//  Copyright © 2017 NAUVAL ADIYASA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.title = "Home"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToFavorite"{
            print("to Favorite!")
            let destinationVC = segue.destination as! ViewRoomViewController
            destinationVC.buildingFilter = "fav"
        }
    }
}

