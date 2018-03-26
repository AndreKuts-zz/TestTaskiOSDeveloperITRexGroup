//
//  Dispatch.swift
//  TestTaskiOSDeveloperITRexGroup
//
//  Created by 1 on 26.03.2018.
//  Copyright © 2018 ANDRE.CORP. All rights reserved.
//

import Foundation


final class Dispatch {
    
    static let mainQueue = DispatchQueue.main
    static let userInteractive = DispatchQueue.global(qos: .userInteractive)
    static let userInitiated = DispatchQueue.global(qos: .userInitiated)
    static let utility = DispatchQueue.global(qos: .utility)
    
    static let sharedInstance = Dispatch()
}







