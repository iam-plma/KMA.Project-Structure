//
//  WalkViewController.swift
//  Project-structure
//
//  Created by Elina Semenko on 01.03.2023.
//

import UIKit

class WalkViewController: UIViewController {
    
    private enum Index {
        case quick
        case guided
    }

    @IBOutlet weak private var container: UIView!
    @IBOutlet weak private var quickStartButton: UIButton!
    @IBOutlet weak private var guidedButton: UIButton!
    @IBOutlet weak private var topLabel: UILabel!
    @IBOutlet weak private var topView: UIView!
    
    private var index: Index = .quick
    private let quickVC = QuickstartViewController()
    private let guidedVC = GuidedViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupChildren()
    }
    
    private func setupChildren() {
        addChild(quickVC)
        addChild(guidedVC)
        
        container.addSubview(quickVC.view)
        container.addSubview(guidedVC.view)
        
        quickVC.didMove(toParent: self)
        guidedVC.didMove(toParent: self)
        
        quickVC.view.frame = container.bounds
        guidedVC.view.frame = container.bounds
        
        guidedVC.view.isHidden = true
    }
    
    private func setupUI() {
        topLabel.text = "GO"
        topLabel.font = UIFont.boldSystemFont(ofSize: 50)
        topLabel.textAlignment = .center
        
        quickStartButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        guidedButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        
        topView.layer.borderWidth = 1
        topView.layer.borderColor = UIColor.darkGray.cgColor
    }
    
    @IBAction func quickStart(_ sender: Any) {
        guard index != .quick else { return }
        index = .quick
        quickStartButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        guidedButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        
        quickVC.view.isHidden = false
        guidedVC.view.isHidden = true
        
    }
    @IBAction func guided(_ sender: Any) {
        guard index != .guided else { return }
        index = .guided
        quickStartButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        guidedButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
        quickVC.view.isHidden = true
        guidedVC.view.isHidden = false
    }
}
