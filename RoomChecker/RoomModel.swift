//
//  RoomModel.swift
//  RoomChecker
//
//  Created by dennis darwis on 7/5/17.
//  Copyright © 2017 NAUVAL ADIYASA. All rights reserved.
//

import Foundation

class RoomModel: NSObject, NSCoding{
    var id:Int=0
    var building:String=""
    var roomDetail:String=""
    var roomName:String=""
    var roomSchedule:String=""
    
    
    
    required override init() {
       
        
        super.init()
    }
    
    //MARK: - NSCoding -
    required init(coder aDecoder: NSCoder) {
        building = aDecoder.decodeObject(forKey: "building") as! String
        roomDetail = aDecoder.decodeObject(forKey: "roomDetail") as! String
        roomName = aDecoder.decodeObject(forKey: "roomName") as! String
        roomSchedule = aDecoder.decodeObject(forKey: "roomSchedule") as! String
        
    }
    
    func encode(with aCoder: NSCoder)  {
        aCoder.encode(building, forKey: "building")
        aCoder.encode(roomDetail, forKey: "roomDetail")
        aCoder.encode(roomSchedule, forKey: "roomSchedule")
        aCoder.encode(roomName, forKey: "roomName")
    }
}
