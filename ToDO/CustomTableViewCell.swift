//
//  CustomTableViewCell.swift
//  ToDO
//
//  Created by Mac on 09/02/17.
//  Copyright © 2017 Mac. All rights reserved.
//


import UIKit

class CustomTableViewCell: UITableViewCell {
    
    let titleLabel = UILabel()
    let datailsLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupCustomCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configCell(title: String?, details: String?) {
        if let title = title {
           self.titleLabel.text = title
        }
        
        if let detailsLabel = details {
            self.datailsLabel.text = detailsLabel
        }
    }
}

extension CustomTableViewCell {
    
    func setupCustomCell(){
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping
        
        datailsLabel.textAlignment = .right
        contentView.addSubview(titleLabel)
        contentView.addSubview(datailsLabel)
        self.accessoryType = .none
        datailsLabel.font = UIFont.systemFont(ofSize: 12, weight: UIFontWeightLight)
        datailsLabel.textColor = UIColor.gray
        
        titleLabel.font = UIFont(
            name: "Bold",
            size: 12.0)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        datailsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        
        let constraints : [NSLayoutConstraint] = [
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            datailsLabel.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            datailsLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: -8),
        ]
        NSLayoutConstraint.activate(constraints)
    }
}


