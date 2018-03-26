//
//  DetailsVC.swift
//  TestTaskiOSDeveloperITRexGroup
//
//  Created by 1 on 21.03.2018.
//  Copyright © 2018 ANDRE.CORP. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController {

    var arrImage: Photo!
    @IBOutlet weak var detailsImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailsImage.image = UIImage(data: arrImage.imageData as Data)
    }

}
