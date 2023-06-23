//
//  BannersCollectionViewCell.swift
//  TestForHummerSystem_ KolesnikovSergey
//
//  Created by Sergey Kolesnikov on 23.06.2023.
//

import UIKit

class BannersCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var mainViewLOL: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainViewLOL.backgroundColor = .cyan
    }

}
