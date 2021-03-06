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
    var fav = Bool()
    var alertAdded = UIAlertController(title: "Added", message: "Added to Favorite", preferredStyle: .alert)
    var alertRemoved = UIAlertController(title: "Removed", message: "Removed from Favorite", preferredStyle: .alert)
    

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
                }
            }
            
            
        }
        if (addorremove){
            favoriteButton.setTitle("Remove from favorite", for: .normal)
        }
        else{
            favoriteButton.setTitle("Add to favorite", for: .normal)
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addtoFavorite(_ sender: Any) {
        let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.default){
            UIAlertAction in
            self.toHome()
        }
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
            alertAdded.addAction(action)
            self.present(alertAdded, animated: true, completion: nil)
            alertAdded = UIAlertController()
        }
        else{
            let myarray2 = userdefaults.object(forKey: "favorite") as? NSData
            let abc2 = NSKeyedUnarchiver.unarchiveObject(with: myarray2! as Data) as? [RoomModel]
            
            for i in abc2!{
                if(i.roomName == roomModel.roomName){
                    addorremove = true
                    break
                }
                index += 1
            }
            favorite.remove(at: index)
            let roomData2 = archiveRoom(room: self.favorite)
            
            self.userdefaults.set(roomData2, forKey: "favorite")
            userdefaults.synchronize()
            alertRemoved.addAction(action)
            self.present(alertRemoved, animated: true, completion: nil)
            alertRemoved = UIAlertController()
        }
        if (addorremove){
            addorremove = false
        }
        viewDidLoad()
        
        
    }
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){
        
    }
    
    func archiveRoom(room:[RoomModel]) -> NSData {
        let archivedObject = NSKeyedArchiver.archivedData(withRootObject: room as NSArray)
        return archivedObject as NSData
    }
    
    func toHome(){
        print("toHome")
        if fav{
            navigationController?.popToRootViewController(animated: true)
        }
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
