//
//  SearchViewController.swift
//  project1
//
//  Created by macbook pro on 7/28/16.
//  Copyright © 2016 macbook pro. All rights reserved.
//

import UIKit


class SearchViewController: UIViewController , SwiftPhotoGalleryDelegate , SwiftPhotoGalleryDataSource {

     let imageNames = ["image1.jpeg", "image2.jpeg", "image3.jpeg"]
    
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

    @IBAction func photoGalleryAction(sender: AnyObject) {
        
        let gallery = SwiftPhotoGallery(delegate: self, dataSource: self)
        
        gallery.backgroundColor = UIColor.blackColor()
        gallery.pageIndicatorTintColor = UIColor.grayColor().colorWithAlphaComponent(0.5)
        gallery.currentPageIndicatorTintColor = UIColor.whiteColor()
        
        //presentViewController(gallery, animated: true, completion: nil)
        
        presentViewController(gallery, animated: false, completion: { () -> Void in
            gallery.currentPage = 2
        })
        
    }
    
    // MARK: SwiftPhotoGalleryDataSource Methods
    
    func numberOfImagesInGallery(gallery: SwiftPhotoGallery) -> Int {
        return imageNames.count
    }
    
    func imageInGallery(gallery: SwiftPhotoGallery, forIndex: Int) -> UIImage? {
        
        return UIImage(named: imageNames[forIndex])
    }
    
    // MARK: SwiftPhotoGalleryDelegate Methods
    
    func galleryDidTapToClose(gallery: SwiftPhotoGallery) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
