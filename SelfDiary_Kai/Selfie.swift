//
//  Selfie.swift
//  SelfDiary_Kai
//
//  Created by Gawain Tsao on 1/18/15.
//  Copyright (c) 2015 Gawain Tsao. All rights reserved.
//

import Foundation
import UIKit

class Selfie : NSObject {
    // a real selfie should have the following
    var mood : String
    var date : NSDate
    var color : UIColor
    
    var note : String?
    var photo : UIImage?
    
    init( mood : String, date : NSDate, color : UIColor) {
        self.mood = mood
        self.date = date
        self.color = color
        
        super.init()
    }
    
    init( mood : String, date : NSDate, color: UIColor, note : String) {
        self.mood = mood
        self.date = date
        self.color = color
        
        self.note = note
        
        super.init()
    }
}