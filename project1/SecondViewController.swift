//
//  SecondViewController.swift
//  project1
//
//  Created by Shivang Dave on 01/08/16.
//  Copyright © 2016 macbook pro. All rights reserved.
//
import UIKit
import MapKit


class SecondViewController: UIViewController, UITextFieldDelegate , MKMapViewDelegate , CLLocationManagerDelegate {
    
    @IBOutlet var mapView:MKMapView? = MKMapView()
    @IBOutlet var textfield:UITextField? = UITextField()
    
    var activityIndicator = UIActivityIndicatorView(frame: CGRectMake(0,0, 50, 50)) as UIActivityIndicatorView
    
    var locationManager = LocationManager.sharedInstance
    var mapManager = MapManager()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.WhiteLarge
        activityIndicator.color = UIColor.blueColor()
        //activityIndicator.backgroundColor = UIColor.brownColor()
        
        // Default address
        
        let address = "405 South 4th street, San Jose, CA, USA."
        
        textfield?.delegate = self
        textfield?.text = address
        
        //
        
        self.mapView?.delegate = self
        self.mapView!.showsUserLocation = true
        
    }
    
    
    
    //#MARK:- Get Current Location Action
    
    @IBAction func getCurrentLocation(sender:UIButton) {
        
        //
        
        locationManager.showVerboseMessage = true
        locationManager.autoUpdate = true
        locationManager.startUpdatingLocationWithCompletionHandler { (latitude, longitude, status, verboseMessage, error) -> () in
            
            print("lat:\(latitude) lon:\(longitude) status:\(status) error:\(error)")
            print(verboseMessage)
            
            let center = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            
            self.mapView!.setRegion(region, animated: true)
        }
    }
    
    
    
    //#MARK:- Get Direction Action From Current Location
    
    @IBAction func getDirection(sender:UIButton) {
        
        let destination =  textfield?.text
        mapManager.directionsFromCurrentLocation(to: destination!) { (route, directionInformation, boundingRegion, error) -> () in
            if (error != nil) {
                print(error!)
            }
            else {
                if let web = self.mapView {
                    dispatch_async(dispatch_get_main_queue()) {
                        self.removeAllPlacemarkFromMap(true)
                        web.addOverlay(route!)
                        self.plotOnMapWithAddress(destination!)
                        web.setVisibleMapRect(boundingRegion!, animated: true)
                    }
                }
            }
        }
    }
    
    
    
    //MARK:- Show Annotation on Map Action
    
    @IBAction func geocode(sender:UIButton) {
        
        activityIndicator.startAnimating()
        view.addSubview(activityIndicator)
        let address = textfield?.text!
        textfield?.resignFirstResponder()
        
        plotOnMapWithAddress(address!)
    }
    
    func locationManagerStatus(status:NSString) {
        
        print(status)
    }
    
    func locationManagerReceivedError(error:NSString) {
        
        print(error)
        activityIndicator.stopAnimating()
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textfield?.resignFirstResponder()
        
        return true
    }
    
    
    //MARK:- MapView Delegate
    
    func mapViewWillStartLocatingUser(mapView: MKMapView) {
    }
    
    func mapView(mapView: MKMapView, rendererForOverlay overlay: MKOverlay) -> MKOverlayRenderer {
        if overlay is MKPolyline {
            let polylineRenderer = MKPolylineRenderer(overlay: overlay)
            polylineRenderer.strokeColor = UIColor.blueColor()
            polylineRenderer.lineWidth = 5
            print("done")
            return polylineRenderer
        }
        return MKOverlayRenderer()
    }
    
    
    //#MARK:- Plot Placemark on MAP from Address
    
    /*
     func plotOnMapUsingGoogleWithAddress(address:NSString) {
     
     locationManager.geocodeUsingGoogleAddressString(address: address) { (geocodeInfo,placemark, error) -> Void in
     
     self.performActionWithPlacemark(placemark, error: error)
     }
     }
     */
    
    func plotOnMapWithAddress(address:NSString) {
        
        locationManager.geocodeAddressString(address: address) { (geocodeInfo,placemark, error) -> Void in
            
            self.performActionWithPlacemark(placemark, error: error)
        }
    }
    
    
    
    //#MARK:- Action For Placemark
    
    func performActionWithPlacemark(placemark:CLPlacemark?,error:String?) {
        
        if error != nil {
            
            print(error)
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                
                if self.activityIndicator.superview != nil {
                    
                    self.activityIndicator.stopAnimating()
                    self.activityIndicator.removeFromSuperview()
                }
            })
        } else {
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.plotPlacemarkOnMap(placemark)
            })
        }
    }
    
    
    //#MARK:- Plot Placemark on Map
    
    func plotPlacemarkOnMap(placemark:CLPlacemark?) {
        
        removeAllPlacemarkFromMap(true)
        
        if self.locationManager.isRunning {
            self.locationManager.stopUpdatingLocation()
        }
        
        if self.activityIndicator.superview != nil {
            
            self.activityIndicator.stopAnimating()
            self.activityIndicator.removeFromSuperview()
        }
        
        let latitudinalMeters = 500.0
        let longitudinalMeters = 500.0
        let theRegion:MKCoordinateRegion = MKCoordinateRegionMakeWithDistance(placemark!.location!.coordinate, latitudinalMeters, longitudinalMeters)
        
        self.mapView?.setRegion(theRegion, animated: true)
        
        self.mapView?.addAnnotation(MKPlacemark(placemark: placemark!))
    }
    
    
    func removeAllPlacemarkFromMap(shouldRemoveUserLocation:Bool) {
        
        if let mapView = self.mapView {
            for annotation in mapView.annotations{
                if shouldRemoveUserLocation {
                    if annotation as? MKUserLocation !=  mapView.userLocation {
                        mapView.removeAnnotation(annotation)
                    }
                }
            }
        }
    }
    /*
     func distanceBetweenTwoLocations(source:CLLocation,destination:CLLocation) -> Double{
     
     var distanceMeters = source.distanceFromLocation(destination)
     var distanceKM = distanceMeters / 1000
     let roundedTwoDigit = distanceKM.roundedTwoDigit
     return roundedTwoDigit
     
     }*/
}


extension Double{
    
    var roundedTwoDigit:Double{
        
        return Double(round(100*self)/100)
        
    }
}


