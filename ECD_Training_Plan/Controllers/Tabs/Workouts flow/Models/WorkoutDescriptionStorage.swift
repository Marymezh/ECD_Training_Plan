//
//  WorkoutDescriptionStorage.swift
//  ECD_Training_Plan
//
//  Created by Мария Межова on 26/1/23.
//

import Foundation

struct WorkoutDescriptionStorage {
    
    enum programsStorage {
        case ecd
        case bodyweight
        case struyach
        case badass
        case hardpress
    }
                                
    
  //  static let programsStorage = [ecd, bodyweight, struyach, badass, hardpress]
    
    
    var ecd = [String]()
    
    var bodyweight: [String] = []
    
    var struyach: [String] = []
    
    var badass = ["15 press", "15 pullups", "15 pushups", "30 crunch", "40 good mornings" ]
    
    var hardpress: [String] = []
    
    
    
    
}
