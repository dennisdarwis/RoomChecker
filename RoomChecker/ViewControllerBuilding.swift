//
//  ViewControllerBuilding.swift
//  RoomChecker
//
//  Created by NAUVAL ADIYASA on 4/05/2017.
//  Copyright © 2017 NAUVAL ADIYASA. All rights reserved.
//

import UIKit

class ViewControllerBuilding: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toA" {
            let destinationVC = segue.destination as! ViewRoomViewController
            destinationVC.buildingFilter = "A"
        } else if segue.identifier == "toB"{
            let destinationVC = segue.destination as! ViewRoomViewController
            destinationVC.buildingFilter = "B"
        } else if segue.identifier == "toC"{
            let destinationVC = segue.destination as! ViewRoomViewController
            destinationVC.buildingFilter = "C"
        } else if segue.identifier == "toHE"{
            let destinationVC = segue.destination as! ViewRoomViewController
            destinationVC.buildingFilter = "HE"
        } else if segue.identifier == "toHD"{
            let destinationVC = segue.destination as! ViewRoomViewController
            destinationVC.buildingFilter = "HD"
        } else if segue.identifier == "toHF"{
            let destinationVC = segue.destination as! ViewRoomViewController
            destinationVC.buildingFilter = "HF"
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 

}
