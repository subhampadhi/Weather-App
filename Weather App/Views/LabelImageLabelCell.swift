//
//  LabelImageLabelCell.swift
//  Weather App
//
//  Created by Subham Padhi on 28/06/19.
//  Copyright © 2019 Subham Padhi. All rights reserved.
//

import Foundation
import UIKit

class LabelImageLabelCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        initViews()
    }
    
    var leftLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.numberOfLines = 0
        return label
    }()
    
    var middleImage: UIImageView = {
        
        let view = UIImageView()
        view.contentMode = UIView.ContentMode.scaleAspectFill
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var rightLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        label.numberOfLines = 0
        return label
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initViews() {
        
        contentView.addSubview(leftLabel)
        contentView.addSubview(rightLabel)
        contentView.addSubview(middleImage)
        
        middleImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        middleImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        middleImage.heightAnchor.constraint(equalToConstant: 70).isActive = true
        middleImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        leftLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        leftLabel.trailingAnchor.constraint(equalTo: middleImage.leadingAnchor , constant: -10).isActive = true
        leftLabel.centerYAnchor.constraint(equalTo: middleImage.centerYAnchor).isActive = true
        
        rightLabel.leadingAnchor.constraint(equalTo: middleImage.trailingAnchor, constant: 10).isActive = true
        rightLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor , constant: -10).isActive = true
        rightLabel.centerYAnchor.constraint(equalTo: middleImage.centerYAnchor).isActive = true
    }
}
