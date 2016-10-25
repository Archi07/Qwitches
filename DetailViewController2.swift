//
//  DetailViewController2.swift
//  project1
//
//  Created by Saloni Shah on 7/28/16.
//  Copyright © 2016 macbook pro. All rights reserved.
//

import UIKit

class DetailViewController2: UIViewController {
    
    @IBOutlet var labelA: UILabel!
    @IBOutlet var price: UILabel!
    @IBOutlet var info: UITextView!
    @IBOutlet var detailImage: UIImageView!
    @IBAction func backButton(sender: AnyObject) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc: ListViewController2 = storyboard.instantiateViewControllerWithIdentifier("ListView2") as! ListViewController2
        self.presentViewController(vc, animated: true, completion: nil)
    }
    var toPass:String!


    @IBAction func addtocart(sender: AnyObject) {
        displayMessageAlert("Your Item is Added to cart!")
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        price.text = "$10"
        if(toPass=="Appetizer"){
            labelA.text = toPass
            info.text = "Appetizer or starter is a small dish served before a meal. Some apetizers are served cold, others hot. They may be served at the dinner table, or in the bedroom, as a part of the meal or they may be served before seating."
            detailImage.image = UIImage(named: "appetizer")
        }else if(toPass=="            Vegetable Delights"){
            labelA.text = toPass
            info.text = "Vegetable delights or Organic Chinese & Japanese vegetarian cuisine & desserts are the stars of this unpretentious eatery."
            detailImage.image = UIImage(named: "vegDelight")
        }else if(toPass=="       Qwiches Special"){
            labelA.text = toPass
            info.text = "Qwiches Specials is known for a menu of casual-dining, globally inspired dishes, such as vegetable jambalaya, Red curry, and pasta with garlic sauce and cherry tomatoes,"
            detailImage.image = UIImage(named: "qwichesSpecial")
        }else if(toPass=="Desserts"){
            labelA.text = toPass
            info.text = "The course usually consists of sweet foods and beverages, such as dessert wine or liqueurs, but may include coffee, cheeses, nuts, or other savory items."
            detailImage.image = UIImage(named: "desert")
        }else{
            labelA.text = "Special Item"
            info.text = "It is a special item of Qwiches made with organic ingredients and flavors."
            detailImage.image = UIImage(named: "vegDelight")
        }



        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func displayMessageAlert(userMessage: String) {
        
        let myAlert = UIAlertController(title: "Cart", message: "Added To the Cart", preferredStyle: UIAlertControllerStyle.Alert)
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler:nil)
        myAlert.addAction(okAction)
        self.presentViewController(myAlert, animated: true, completion: nil)
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
