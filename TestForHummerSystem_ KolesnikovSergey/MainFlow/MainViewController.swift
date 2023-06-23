//
//  MainViewController.swift
//  TestForHummerSystem_ KolesnikovSergey
//
//  Created by Sergey Kolesnikov on 22.06.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Constants
    
    
    // MARK: - PrivateViews
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.contentSize = contentSize
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange // TODO: -
        view.frame.size = contentSize
        return view
    }()
    
    // MARK: - Views
    
    let bannersCollectionView: UICollectionView = {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        collectionView.backgroundColor = .red // TODO: -
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 4, left: 16, bottom: 4, right: 16)
        
        return collectionView
    }()
    
    let categoriesCollectionView: UICollectionView = {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        
        return collectionView
    }()
    
    
    let menuCollectionView: UICollectionView = {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        collectionView.showsVerticalScrollIndicator = false
        
        return collectionView
    }()
    
    // MARK: - Properties
    
    private var contentSize: CGSize {     // TODO: - RemoveThisProperty
        CGSize(width: view.frame.width, height: view.safeAreaLayoutGuide.layoutFrame.height - 5)
    }
    
    
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
        
        // TODO: - Create Extencion for NavigationController
        
        navigationController?.view.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = .white
        
        
        setConstreints()
        configureCollections()
    }
    
    func configureCollections() {
        
        // bannersCollectionView
        
        bannersCollectionView.delegate = self
        bannersCollectionView.dataSource = self
        bannersCollectionView.register(UINib(nibName: "\(BunnersCollectionViewCell.self)", bundle: .main), forCellWithReuseIdentifier: "\(BunnersCollectionViewCell.self)")
        
        // categoriesCollectionView
        
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.register(UINib(nibName: "\(BunnersCollectionViewCell.self)", bundle: .main), forCellWithReuseIdentifier: "\(BunnersCollectionViewCell.self)")
        
        // menuCollectionView
        
        menuCollectionView.delegate = self
        menuCollectionView.dataSource = self
        menuCollectionView.register(UINib(nibName: "\(BunnersCollectionViewCell.self)", bundle: .main), forCellWithReuseIdentifier: "\(BunnersCollectionViewCell.self)")
        
    }
    
    func setConstreints() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        scrollView.addSubview(contentView)
        
        
        bannersCollectionView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(bannersCollectionView)
        NSLayoutConstraint.activate([
            bannersCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            bannersCollectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            bannersCollectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            bannersCollectionView.heightAnchor.constraint(equalToConstant: 120)
        ])
        
        categoriesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(categoriesCollectionView)
        NSLayoutConstraint.activate([
            categoriesCollectionView.topAnchor.constraint(equalTo: bannersCollectionView.bottomAnchor),
            categoriesCollectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            categoriesCollectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            categoriesCollectionView.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        menuCollectionView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(menuCollectionView)
        NSLayoutConstraint.activate([
            menuCollectionView.topAnchor.constraint(equalTo: categoriesCollectionView.bottomAnchor),
            menuCollectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            menuCollectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            menuCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case bannersCollectionView:
            return 2
        case categoriesCollectionView:
            return 2
        default:
            return 2
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = bannersCollectionView.dequeueReusableCell(withReuseIdentifier: "\(BunnersCollectionViewCell.self)", for: indexPath)
        guard let cell = cell as? BunnersCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.imageName = "111"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case bannersCollectionView:
            return CGSize(width: 300, height: 112)
        default:
            return CGSize(width: 30, height: 30)
        }
    }
}
