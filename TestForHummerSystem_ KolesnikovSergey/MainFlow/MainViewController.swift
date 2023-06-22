//
//  MainViewController.swift
//  TestForHummerSystem_ KolesnikovSergey
//
//  Created by Sergey Kolesnikov on 22.06.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Constants
    
    
    // MARK: - Views
    
    
    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        configureAppearance()
    }
    
    // MARK: - Methods
    
}

// MARK: - PrivateMethods

private extension MainViewController {
    
    func configureAppearance() {
        view.backgroundColor = .blue
    }
}
