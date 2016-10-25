//
//  MenuViewController.swift
//  project1
//
//  Created by macbook pro on 7/28/16.
//  Copyright © 2016 macbook pro. All rights reserved.
//

import UIKit


class MenuViewController: UIViewController {
    
    @IBAction func breakfastButton(sender: AnyObject) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc: ListViewController = storyboard.instantiateViewControllerWithIdentifier("ListView") as! ListViewController
        self.presentViewController(vc, animated: true, completion: nil)
        
    }
    @IBAction func lunchButton(sender: AnyObject) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc: ListViewController2 = storyboard.instantiateViewControllerWithIdentifier("ListView2") as! ListViewController2
        self.presentViewController(vc, animated: true, completion: nil)
    }
    @IBAction func backButton(sender: AnyObject) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc: SearchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchView") as! SearchViewController
        self.presentViewController(vc, animated: true, completion: nil)
    }

    @IBOutlet var breakfastImage: UIButton!
    @IBOutlet var lunchImage: UIButton!
    @IBOutlet var dinnerImage: UIButton!
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        breakfastImage.layer.cornerRadius = breakfastImage.frame.size.width/2
        breakfastImage.clipsToBounds = true
        lunchImage.layer.cornerRadius = lunchImage.frame.size.width/2
        lunchImage.clipsToBounds = true
        dinnerImage.layer.cornerRadius = dinnerImage.frame.size.width/2
        dinnerImage.clipsToBounds = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
