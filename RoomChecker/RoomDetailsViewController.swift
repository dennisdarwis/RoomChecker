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
    var favorite = [RoomModel]()
    var addorremove = false
    var index = 0
    let userdefaults = UserDefaults.standard

    @IBOutlet var favoriteButton: UIButton!
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
        
        if userdefaults.object(forKey: "favorite") != nil{
            let myarray = userdefaults.object(forKey: "favorite") as? NSData
            let abc = NSKeyedUnarchiver.unarchiveObject(with: myarray! as Data) as? [RoomModel]
            for i in abc!{
                favorite.append(i)
                if(i.roomName == roomModel.roomName){
                    addorremove = true
                    index += 1
                }
                
            }
            
            
        }
        if (addorremove){
            favoriteButton.setTitle("Remove from favorite", for: .normal)
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addtoFavorite(_ sender: Any) {
        
        
        if userdefaults.object(forKey: "favorite") == nil{
            let roomData = archiveRoom(room: [roomModel])
            
            userdefaults.set(roomData, forKey: "favorite")
            userdefaults.synchronize()
            let abc = NSKeyedUnarchiver.unarchiveObject(with: roomData as Data) as? [RoomModel]
            for i in abc!{
                favorite.append(i)
            }
            print(favorite[0].building)
            
        
        }
        else if(!addorremove){
            self.favorite.append(roomModel)
            let roomData2 = archiveRoom(room: self.favorite)
            
            self.userdefaults.set(roomData2, forKey: "favorite")
            userdefaults.synchronize()
            print(favorite[0].roomName)
        }
        else{
            favorite.remove(at: index)
            let roomData2 = archiveRoom(room: self.favorite)
            
            self.userdefaults.set(roomData2, forKey: "favorite")
            userdefaults.synchronize()
            print(favorite[0].roomName)
        }
    }
    func archiveRoom(room:[RoomModel]) -> NSData {
        let archivedObject = NSKeyedArchiver.archivedData(withRootObject: room as NSArray)
        return archivedObject as NSData
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
