//
//  RouteTableViewCell.swift
//  Project-structure
//
//  Created by Elina Semenko on 02.03.2023.
//

import UIKit

class RouteTableViewCell: UITableViewCell {
    
    @IBOutlet weak private var bgView: UIView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var lengthLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layoutSubviews()
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let margins = UIEdgeInsets(top: 10, left: 3, bottom: 10, right: 3)
        contentView.frame = contentView.frame.inset(by: margins)
    }
    
    func configure(with route: Route) {
        titleLabel.text = route.name
        lengthLabel.text = "\(route.length) km"
    }
    
    private func setupUI() {
        bgView.layer.masksToBounds = true
        bgView.layer.cornerRadius = 15
        
        bgView.layer.borderWidth = 1
        bgView.layer.borderColor = UIColor.darkGray.cgColor
    }
}
