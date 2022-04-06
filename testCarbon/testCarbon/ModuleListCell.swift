//
//  ModuleListCell.swift
//  testCarbon
//
//  Created by User on 4/5/22.
//

import UIKit

class ModuleListCell: UICollectionViewCell {

    @IBOutlet var btnModule: UIButton!
    @IBOutlet var lblName: UILabel!
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        lblName.minimumScaleFactor = 0.5
        lblName.adjustsFontSizeToFitWidth = true

    }
    
}

extension UILabel {
    func setSizeFont (sizeFont: Double) {
        self.font =  UIFont(name: self.font.fontName, size: sizeFont)!
        self.sizeToFit()
    }
}

