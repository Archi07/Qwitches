//
//  ListViewController.swift
//  project1
//
//  Created by Saloni Shah on 7/28/16.
//  Copyright © 2016 macbook pro. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet var snack1Image: UIButton!
    @IBOutlet var manchurian: UIButton!
    
    @IBOutlet var snack2Image: UIButton!
    
    @IBOutlet var refreshmentImage: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        snack1Image.layer.cornerRadius = snack1Image.frame.size.width/2
        snack1Image.clipsToBounds = true
        manchurian.layer.cornerRadius = manchurian.frame.size.width/2
        manchurian.clipsToBounds = true
        snack2Image.layer.cornerRadius = snack2Image.frame.size.width/2
        snack2Image.clipsToBounds = true
        refreshmentImage.layer.cornerRadius = refreshmentImage.frame.size.width/2
        refreshmentImage.clipsToBounds = true

        // Do any additional setup after loading the view.
    }
    @IBOutlet var manchurianButton: UIButton!
    @IBOutlet var SnackButton: UIButton!
    @IBOutlet var sandwichButton: UIButton!
    @IBOutlet var refreshmentButton: UIButton!

    
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
        var svc = segue!.destinationViewController as!DetailViewController;
        
        if(segue.identifier == "btnSubmitSegue") {
            svc.toPass = manchurianButton.currentTitle
        }
        if(segue.identifier == "btnSnackCombo") {
            svc.toPass = SnackButton.currentTitle
        }
        if(segue.identifier == "btnSandwiches") {
            svc.toPass = sandwichButton.currentTitle
        }
        if(segue.identifier == "btnRefreshment") {
            svc.toPass = refreshmentButton.currentTitle
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
