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
    

    @IBAction func abc(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondViewController = storyboard.instantiateViewController(withIdentifier: "ViewControllerBuilding") as! ViewControllerBuilding
        self.present(secondViewController, animated: true, completion: nil)
    }

}

