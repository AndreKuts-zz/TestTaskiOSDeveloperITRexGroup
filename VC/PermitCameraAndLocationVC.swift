//
//  PermitCameraAndLocationVC.swift
//  TestTaskiOSDeveloperITRexGroup
//
//  Created by 1 on 21.03.2018.
//  Copyright © 2018 ANDRE.CORP. All rights reserved.
//

import UIKit
import AVFoundation
import CoreLocation

class PermitCameraAndLocationVC: UIViewController, CLLocationManagerDelegate {

    let userInteractive = DispatchQueue.global(qos: .userInteractive)
    private let locationManager = CLLocationManager()
    private var buttLoc = UIButton()
    private var buttCam = UIButton()
    private var cheсkAutorize = CheсkAut(Location: .notAutorize, Camera: .notAutorize) {
        didSet {
            userInteractive.async {
                self.tryGoToGallery ()
            }
        }
    }
    
    
    // MARK: - VDL
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        setButAndAuthoriz ()
    }
    
    
    func setButAndAuthoriz () {
        let but1 = view.viewWithTag(1) as! UIButton
        buttLoc = but1
        let but2 = view.viewWithTag(2) as! UIButton
        buttCam = but2
        
        if checkLocation() {
            buttLoc.isHidden = true
            cheсkAutorize.Location = .autorize
        }
        if cheсkCamera() {
            buttCam.isHidden = true
            cheсkAutorize.Camera = .autorize
        }
    }
    
    
    
    
    
    // MARK: - Button
    @IBAction func usingLocation(_ sender: UIButton) {
        tryGoToGallery()
        if checkLocation() {
            cheсkAutorize.Location = .autorize
        } else {
            locationManager.requestWhenInUseAuthorization()
            cheсkAutorize.Location = .notAutorize
        }
    }
    
    
    @IBAction func usingCamera(_ sender: UIButton) {
        tryGoToGallery()
        if cheсkCamera() {
            cheсkAutorize.Camera = .autorize
        } else {
            AVCaptureDevice.requestAccess(for: .video, completionHandler: { (authorize: Bool) in
                if authorize {
                    self.cheсkAutorize.Camera = .autorize
                }
            })
        }
    }
    
    
    // MARK: - else
    func tryGoToGallery () {
        if cheсkCamera() && checkLocation() {
            self.performSegue(withIdentifier: "goToGallery", sender: self)
        }
    }

    
    func cheсkCamera () -> Bool {
        if AVCaptureDevice.authorizationStatus(for: .video) == .authorized {
            return true
        } else { return false }
    }
    
    
    func checkLocation () -> Bool {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            return true
        } else { return false }
    }
}

