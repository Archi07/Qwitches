//
//  ViewController.swift
//  project1
//
//  Created by macbook pro on 7/21/16.
//  Copyright © 2016 macbook pro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var pass_txt: UITextField!
    @IBOutlet var user_txt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func login(sender: AnyObject) {
        
        
        if user_txt.text=="admin" && pass_txt.text=="admin"
        {
            
            
            let loginPageView = self.storyboard?.instantiateViewControllerWithIdentifier("tabBar") as! UITabBarController
            self.navigationController?.pushViewController(loginPageView, animated: true)
           

        }
    }

}

