//
//  HomeViewController.swift
//  Twitter
//
//  Created by Bogdan Sasko on 9/9/18.
//  Copyright © 2018 Bogdan Sasko. All rights reserved.
//

import LBTAComponents


class HomeViewController: DatasourceController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        self.datasource = UsersDataSource()
        self.collectionView?.backgroundColor = UIColor(r: 232, g: 236, b: 241)
        setupNavigationBar()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            guard let user = self.datasource?.item(indexPath) as? User else { return CGSize(width: self.view.frame.width, height: 100)}
            let maxStringSize = CGSize(width: self.view.frame.width - 12 - 50 - 12 - 4, height: 1000)
            let attributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)]
            var estimatedTextSize = NSString(string: user.bioText).boundingRect(with: maxStringSize, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
            
            estimatedTextSize.size.width = self.view.frame.width
            estimatedTextSize.size.height = estimatedTextSize.size.height + 66
            
            return estimatedTextSize.size
        case 1:
            guard let tweet = self.datasource?.item(indexPath) as? Tweet else { return CGSize(width: self.view.frame.width, height: 100)}
            return CGSize(width: self.view.frame.width, height: 150)
        default:
            return CGSize.zero
        }
    }
}

extension HomeViewController {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        switch section {
        case 0: return CGSize(width: self.view.frame.width, height: 50)
        case 1: return CGSize.zero
        default: return CGSize.zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        switch section {
        case 0: return CGSize(width: self.view.frame.width, height: 64)
        case 1: return CGSize.zero
        default: return CGSize.zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
