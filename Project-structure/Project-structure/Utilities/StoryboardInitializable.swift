//
//  StoryboardInitializable.swift
//  Project-structure
//
//  Created by Elina Semenko on 01.03.2023.
//

import Foundation
import UIKit

protocol StoryboardInitializable {
    static func instantiate() -> Self
}

extension StoryboardInitializable where Self: UIViewController {
    
    //  Storyboard identifier should be equal to class name!
    static func instantiate() -> Self {
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
