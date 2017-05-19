//
//  ViewRoomViewController.swift
//  RoomChecker
//
//  Created by dennis darwis on 7/5/17.
//  Copyright © 2017 NAUVAL ADIYASA. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewRoomViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var tableView: UITableView!
    var lists = [RoomModel]()
    let headers: HTTPHeaders = [
        "X-DreamFactory-Api-Key": "62220ea2b6d61eb7aca380d40801ffccbc08bec358c72843023f626774493ac9",
        "Content-Type": "application/json; charset=utf-8"
    ]
    var arrRes = [[String: AnyObject]]()
    var buildingFilter = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(buildingFilter)
        /** Testing for placeholder data
        let roomModel = RoomModel()
        roomModel.building = "A"
        roomModel.id = 0
        roomModel.roomDetail = "studying room"
        roomModel.roomName = "P.90"
        roomModel.roomSchedule = "monday: 9:00AM - 8:00PM/ntuesday: 9:00AM - 8:00PM/n"
        lists.append(roomModel)
        **/
        if buildingFilter != "fav"{
            reload(filter:buildingFilter)
        } else{
            let defaults = UserDefaults.standard
            let myarray = defaults.object(forKey: "favorite") as? NSData
            let abc = NSKeyedUnarchiver.unarchiveObject(with: myarray! as Data) as? [RoomModel]
            for i in abc!{
                lists.append(i)
            }
            self.tableView.reloadData()
        }
        // Do any additional setup after loading the view.
    }
    
    func reload(filter: String){
        let url = "http://130.211.249.152/api/v2/mysql/_table/roomChecker?filter=building%20%3D%20"+filter
        print("url "+url)
        Alamofire.request(url, headers:headers).responseJSON { response in
            let swiftyJsonVar = JSON(response.result.value!)
            print("swiftyJsonVar "+String(describing: swiftyJsonVar))
            if let resData = swiftyJsonVar["resource"].arrayObject {
                self.arrRes = resData as! [[String: AnyObject]]
                
                for i in self.arrRes{
                    let roomModel = RoomModel()
                    roomModel.id = i["id"] as! Int
                    roomModel.roomName = i["roomName"] as! String
                    roomModel.building = i["building"] as! String
                    roomModel.roomDetail = i["roomDetail"] as! String
                    roomModel.roomSchedule = i["roomSchedule"] as! String
                    self.lists.append(roomModel)
                }
            }
            if self.arrRes.count > 0 {
                self.tableView.reloadData()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as!CustomViewCell
        cell.roomName.text = lists[indexPath.row].roomName
        return cell
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toRoomDetails"{
            let destinationVC = segue.destination as! RoomDetailsViewController
            destinationVC.roomModel = lists[(tableView.indexPathForSelectedRow?.row)!]
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
