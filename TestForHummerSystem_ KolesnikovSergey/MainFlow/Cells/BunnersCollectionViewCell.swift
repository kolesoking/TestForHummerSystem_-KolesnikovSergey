//
//  BunnersCollectionViewCell.swift
//  TestForHummerSystem_ KolesnikovSergey
//
//  Created by Sergey Kolesnikov on 23.06.2023.
//

import UIKit

class BunnersCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Views

    @IBOutlet weak var bannerImage: UIImageView!
    
    // MARK: - Properties
    
    var imageName: String = "" {
        didSet {
            bannerImage.image = UIImage(named: imageName)
        }
    }
    
    // MARK: - UICollectionViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearance()
    }

}

// MARK: - PrivateMethods

private extension BunnersCollectionViewCell {
    func configureAppearance() {
        bannerImage.backgroundColor = .link
        bannerImage.layer.cornerRadius = 10
    }
}
