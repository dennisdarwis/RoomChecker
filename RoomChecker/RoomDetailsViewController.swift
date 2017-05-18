//
//  RoomDetailsViewController.swift
//  RoomChecker
//
//  Created by dennis darwis on 7/5/17.
//  Copyright © 2017 NAUVAL ADIYASA. All rights reserved.
//

import UIKit

class RoomDetailsViewController: UIViewController {
    var roomModel = RoomModel()

    @IBOutlet var roomName: UILabel!
    @IBOutlet var buildingName: UILabel!
    @IBOutlet var roomDetails: UILabel!
    @IBOutlet var roomSchedule: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(roomModel.roomName+"\n"+roomModel.roomDetail)
        roomName.text = roomModel.roomName
        buildingName.text = roomModel.building
        roomDetails.text = roomModel.roomDetail
        roomSchedule.numberOfLines = 0
        roomSchedule.text = roomModel.roomSchedule.replacingOccurrences(of: "/n", with: "")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
