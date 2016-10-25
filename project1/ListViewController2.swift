//
//  ListViewController2.swift
//  project1
//
//  Created by Saloni Shah on 7/28/16.
//  Copyright © 2016 macbook pro. All rights reserved.
//

import UIKit

class ListViewController2: UIViewController {
    
    @IBOutlet var apetizerImage: UIButton!
    @IBOutlet var vegDelightImage: UIButton!
    @IBOutlet var qwichesSpecialImage: UIButton!
    @IBOutlet var desertImage: UIButton!
    
    @IBOutlet var appetizerButton: UIButton!
    @IBOutlet var vegDelights: UIButton!
    @IBOutlet var qwichesSpecialButton: UIButton!
    @IBOutlet var dessertButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        apetizerImage.layer.cornerRadius = apetizerImage.frame.size.width/2
        apetizerImage.clipsToBounds = true
        vegDelightImage.layer.cornerRadius = vegDelightImage.frame.size.width/2
        vegDelightImage.clipsToBounds = true
        qwichesSpecialImage.layer.cornerRadius = qwichesSpecialImage.frame.size.width/2
        qwichesSpecialImage.clipsToBounds = true
        desertImage.layer.cornerRadius = desertImage.frame.size.width/2
        desertImage.clipsToBounds = true

        // Do any additional setup after loading the view.
    }
    @IBAction func backButton(sender: AnyObject) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc: MenuViewController = storyboard.instantiateViewControllerWithIdentifier("MenuView") as! MenuViewController
        self.presentViewController(vc, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        var svc = segue!.destinationViewController as! DetailViewController2;
        
        if(segue.identifier == "btnApetizerSegue") {
            svc.toPass = appetizerButton.currentTitle
        }
        if(segue.identifier == "btnVegDelightSegue") {
            svc.toPass = vegDelights.currentTitle
        }
        if(segue.identifier == "btnQwichSpecialSegue") {
            svc.toPass = qwichesSpecialButton.currentTitle
        }
        if(segue.identifier == "btnDesertSegue") {
            svc.toPass = dessertButton.currentTitle
        }
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
