//
//  DetailViewController.swift
//  project1
//
//  Created by Saloni Shah on 7/28/16.
//  Copyright © 2016 macbook pro. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var labelA: UILabel!
    @IBOutlet var price: UILabel!
    @IBOutlet var info: UITextView!
    @IBOutlet var detailImage: UIImageView!
    
    @IBAction func backButton(sender: AnyObject) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc: ListViewController = storyboard.instantiateViewControllerWithIdentifier("ListView") as! ListViewController
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    var toPass:String!

    @IBAction func addtocart(sender: AnyObject) {
        displayMessageAlert("Your Item is Added to cart!")
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        price.text = "$12"
        if(toPass=="      Gobi Manchurian"){
            labelA.text = toPass
            info.text = "Gobi Manchurian is made from Cauliflower florets also known as Gobi or Gobhi. This recipe of Gobi Manchurian has a sauce.This Indo Chinese recipe of Gobi Manchurian pairs very well with some steamed rice or plain noodles.There are few more manchurian recipes available like Paneer Manchurian, Dry Mushroom Manchurian, Veg Manchurian, Baby Corn Manchurian."
            detailImage.image = UIImage(named: "manchurian")
        }else if(toPass=="Snack Combo"){
            labelA.text = toPass
            info.text = "A snack is a portion of food, smaller than a regular meal, generally eaten between meals.Snacks come in a variety of forms including packaged snack foods and other processed foods, as well as items made from fresh ingredients at home.Traditionally, snacks are prepared from ingredients commonly available in the home. Often cold cuts, fruit, leftovers, nuts, sandwiches, and the like are used as snacks."
            detailImage.image = UIImage(named: "snack2")
        }else if(toPass=="Sandwiches"){
            labelA.text = toPass
            info.text = "A sandwich is a food item consisting of one or more types of food, such as vegetables, sliced cheese or meat, placed on or between slices of bread, or more generally any dish wherein two or more pieces of bread serve as a container or wrapper for some other food."
            detailImage.image = UIImage(named: "snack1")
        }else if(toPass=="   Refreshments"){
            labelA.text = toPass
            info.text = "Refreshments include juice, soft drinks, and carbonated drinks, have some form of water in them, water itself is often not classified as a beverage, and the word beverage has been recurrently defined as not referring to water.An alcoholic beverage is a drink containing ethanol, commonly known as alcohol, although in chemistry the definition of an alcohol includes many other compounds. Alcoholic beverages, such as wine, beer, and liquor, have been part of human culture."
            detailImage.image = UIImage(named: "refreshment")
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
