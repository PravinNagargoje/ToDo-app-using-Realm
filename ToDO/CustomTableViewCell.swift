//
//  CustomTableViewCell.swift
//  ToDO
//
//  Created by Mac on 09/02/17.
//  Copyright © 2017 Mac. All rights reserved.
//


import UIKit

class CustomTableViewCell: UITableViewCell {
    
    let whiteView = UIView()
    let titleLabel = UILabel()
    let datailsLabel = UIImageView()
    let createdDateLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = UIColor.primaryColor()
        
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
        
        self.contentView.addSubview(self.whiteView)
        self.whiteView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.whiteView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            self.whiteView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8),
            self.whiteView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8),
            self.whiteView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8)
            ])
        
        self.whiteView.backgroundColor = UIColor.white
        self.contentView.bringSubview(toFront: self.whiteView)
        self.whiteView.layer.cornerRadius = 5
        self.whiteView.layer.masksToBounds = true
        
        self.whiteView.addSubview(titleLabel)
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.font = UIFont(
            name: "Bold",
            size: 12.0
        )
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: self.whiteView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: self.whiteView.trailingAnchor, constant: -32),
            titleLabel.topAnchor.constraint(equalTo: self.whiteView.topAnchor, constant: 8),
            titleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 30)
        ])
  
        self.whiteView.addSubview(datailsLabel)
        self.whiteView.addSubview(createdDateLabel)
      
        createdDateLabel.textColor = UIColor.darkGray
        createdDateLabel.font = UIFont(name: "Optima-Regular", size: 12)
     
        datailsLabel.translatesAutoresizingMaskIntoConstraints = false
        createdDateLabel.translatesAutoresizingMaskIntoConstraints = false
      
        NSLayoutConstraint.activate([
            createdDateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            createdDateLabel.bottomAnchor.constraint(equalTo: self.whiteView.bottomAnchor, constant: -8),
            createdDateLabel.heightAnchor.constraint(equalToConstant: 16),
            createdDateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            datailsLabel.centerYAnchor.constraint(equalTo: self.whiteView.centerYAnchor),
            datailsLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: -8),
            datailsLabel.widthAnchor.constraint(equalToConstant: 25),
            datailsLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
}
