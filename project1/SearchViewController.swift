//
//  SearchViewController.swift
//  project1
//
//  Created by macbook pro on 7/28/16.
//  Copyright © 2016 macbook pro. All rights reserved.
//

import UIKit
import SwiftPhotoGallery

class SearchViewController: UIViewController , SwiftPhotoGalleryDelegate , SwiftPhotoGalleryDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func Menu(sender: AnyObject) {
        
        
        /*let loginPageView = self.storyboard?.instantiateViewControllerWithIdentifier("MenuViewController") as! UITabBarController
        self.navigationController?.pushViewController(loginPageView, animated: true)*/
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc: MenuViewController = storyboard.instantiateViewControllerWithIdentifier("MenuView") as! MenuViewController
        self.presentViewController(vc, animated: true, completion: nil)
        
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
