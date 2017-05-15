//
//  ViewRoomViewController.swift
//  RoomChecker
//
//  Created by dennis darwis on 7/5/17.
//  Copyright © 2017 NAUVAL ADIYASA. All rights reserved.
//

import UIKit

class ViewRoomViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var tableView: UITableView!
    var lists = [RoomModel]()
    var arrRes = [[String: AnyObject]]()
    var stringPassed = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(stringPassed)
        let roomModel = RoomModel()
        roomModel.building = "A"
        roomModel.id = 0
        roomModel.roomDetail = "studying room"
        roomModel.roomName = "P.90"
        roomModel.roomSchedule = "monday: 9:00AM - 8:00PM/ntuesday: 9:00AM - 8:00PM/n"
        lists.append(roomModel)
    
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as!CustomViewCell
        cell.roomName.text = lists[indexPath.row].roomName
        
        /**
        let imageUrl = URL(string: lists[indexPath.row].imageUrl)
        cell.eventImage.kf.setImage(with: imageUrl)
        cell.eventName.text=lists[indexPath.row].eventName
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMMM yyyy"
        let eventDate = lists[indexPath.row].eventTimestamp
        let dateString = dateFormatter.string(from: eventDate)
        cell.eventDate.text = dateString
        
         let image = NSData(strurl)
         cell.eventImage.image = eventImages[indexPath.row]
         cell.eventName.text = eventNames[indexPath.row]
         cell.eventVenue.text = eventVenues[indexPath.row]
         cell.eventPrice.text = eventPrices[indexPath.row]
         cell.eventDate.text = eventDates[indexPath.row]
         **/
        return cell
        
    }
    

}
