//
//  DETAILSViewController.swift
//  project1
//
//  Created by 16601 on 7/31/16.
//  Copyright © 2016 macbook pro. All rights reserved.
//

import UIKit

class DETAILSViewController: UIViewController {

    @IBAction func PAY(sender: AnyObject) {
        var alert: UIAlertView = UIAlertView(title: "Loading", message: "Please wait...", delegate: nil, cancelButtonTitle: "Cancel");
        
        var loadingIndicator: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(50, 10, 37, 37)) as UIActivityIndicatorView
        loadingIndicator.center = self.view.center;
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        loadingIndicator.startAnimating();
        
        alert.setValue(loadingIndicator, forKey: "accessoryView")
        loadingIndicator.startAnimating()
        
        alert.show()
        // Delay the dismissal by 5 seconds
        let delay = 10.0 * Double(NSEC_PER_SEC)
        var time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue(), {
            alert.dismissWithClickedButtonIndex(-1, animated: true)
        })
        var alert1 = UIAlertView()
        alert.title="THANK YOU!"
        alert.message="PAYMENT IS BEING ACCEPTED."
        alert.addButtonWithTitle("OK")
        alert.show()
        
        
        
    }}
    

