//
//  CustomCell.swift
//  AppartoTest
//
//  Created by grami on 3/8/19.
//  Copyright © 2019 grami. All rights reserved.
//

import Foundation
import UIKit

protocol BarCellDelegate{
    func didTabDetails(bar : Bar)
}

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var detailsButton: UIButton!
    @IBOutlet weak var barName: UILabel!
    @IBOutlet weak var barImage: UIImageView!

    var delegate : BarCellDelegate?
    var barItem : Bar!
    
    func setup(bar: Bar) {
        barItem = bar
        barName.text = bar.name
        if bar.image_url != nil {
            BarsServices.loadAndSetUpImageByUrl(image_url: bar.image_url!, barImage: self.barImage)
        }
        self.detailsButton.titleLabel?.font = UIFont.fontAwesome(ofSize: 25, style: .solid)
        self.detailsButton.setTitle(String.fontAwesomeIcon(name: .infoCircle), for: .normal)
    }
    
    @IBAction func DetailsTapped(_ sender: Any) {
        delegate?.didTabDetails(bar: barItem)
    }
}
