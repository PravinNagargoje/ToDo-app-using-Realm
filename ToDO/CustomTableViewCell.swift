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
    let datailsLabel = UIImageView()
    let createdDateLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupCustomCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configCell(title: String?, details: String?, created: String?) {
        if let title = title {
           self.titleLabel.text = title
        }
        
        if let created = created {
            self.createdDateLabel.text = "Created on: \(created) "
        }
        
        if details != nil {
            self.datailsLabel.image = UIImage(named: details!)
        }
    }
}

extension CustomTableViewCell {
    
    func setupCustomCell(){
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(datailsLabel)
        contentView.addSubview(createdDateLabel)
      
        createdDateLabel.textColor = UIColor.darkGray
        createdDateLabel.font = UIFont(name: "Optima-Regular", size: 12)
        titleLabel.font = UIFont(
            name: "Bold",
            size: 12.0
        )
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        datailsLabel.translatesAutoresizingMaskIntoConstraints = false
        createdDateLabel.translatesAutoresizingMaskIntoConstraints = false
      
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 30),
            
            createdDateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            createdDateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            createdDateLabel.heightAnchor.constraint(equalToConstant: 16),
            createdDateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            datailsLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            datailsLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: -8),
            datailsLabel.widthAnchor.constraint(equalToConstant: 25),
            datailsLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
}
