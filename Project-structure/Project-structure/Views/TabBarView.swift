//
//  TabBarView.swift
//  Project-structure
//
//  Created by Elina Semenko on 01.03.2023.
//

import UIKit

protocol TabDelegate: AnyObject {
    func navigate(to index: Int)
}

class TabBarView: UIView {
    @IBOutlet private var contentView: UIView!
    weak var delegate: TabDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("TabBarView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    @IBAction func btn1(_ sender: Any) {
        delegate?.navigate(to: 0)
    }
    @IBAction func btn2(_ sender: Any) {
        delegate?.navigate(to: 1)
    }
    @IBAction func btn3(_ sender: Any) {
        delegate?.navigate(to: 2)
    }
}
