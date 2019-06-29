//
//  LblImgLblViewModel.swift
//  Weather App
//
//  Created by Subham Padhi on 29/06/19.
//  Copyright © 2019 Subham Padhi. All rights reserved.
//

import Foundation
import UIKit

class LblImgLblViewModel {
    
    let leftLabelText: NSMutableAttributedString
    let rightLabelText: NSMutableAttributedString
    let imageURL: String
    
    init(leftLabelText:NSMutableAttributedString ,rightLabelText:NSMutableAttributedString , imageURL:String) {
        self.leftLabelText = leftLabelText
        self.rightLabelText = rightLabelText
        self.imageURL = imageURL
    }
}

extension LblImgLblViewModel: CellFunctions {
    
    static func registerCell(tableView: UITableView) {
        tableView.register(LabelImageLabelCell.self, forCellReuseIdentifier: "labelImageLabelCell")
    }
    
    func cellInstantiate(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "labelImageLabelCell", for: indexPath) as! LabelImageLabelCell
        cell.leftLabel.attributedText = leftLabelText
        cell.rightLabel.attributedText = rightLabelText
        cell.middleImage.image = UIImage(url: URL(string:AppUtils.getURLForIcons(icon: imageURL)))
        cell.selectionStyle = .none
        
        return cell
    }
}

