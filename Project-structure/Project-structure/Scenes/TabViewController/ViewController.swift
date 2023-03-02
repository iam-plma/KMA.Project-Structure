//
//  ViewController.swift
//  Project-structure
//
//  Created by Elina Semenko on 01.03.2023.
//

import UIKit

class ViewController: UITabBarController, StoryboardInitializable {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
    }
    
    
    private func generateTabBar(){
        viewControllers = [
            generateVC(
                viewController: WalkViewController(),
                image:  UIImage(named: "PointAnnotation")
        ),
            generateVC(
                viewController: MapViewController(),
                image: UIImage(named: "WalkAnnotation")
                
            ),
            generateVC(
                viewController: StatisticsViewController(),
                image: UIImage(named: "StatisticAnnotation")
            )
        ]
    }
    
    
    private func generateVC(viewController: UIViewController, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.image = image
        return viewController
    }
}

