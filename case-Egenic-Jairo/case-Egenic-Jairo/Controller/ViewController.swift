//
//  ViewController.swift
//  case-Egenic-Jairo
//
//  Created by Jairo on 08/09/2022.
//

import UIKit

class ViewController: UICollectionViewController {
    
    private var viewModel: CatsViewModel!
    var site: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.collectionViewLayout = CatsLayout(size: CGSize(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.width / 2))
        setCollectionItemSize()
        collectionView.prefetchDataSource = self
        
        let request = CatsRequest()
        viewModel = CatsViewModel(request: request, delegate: self)
        
        viewModel.fetchCats()
        collectionView.register(CatCollectionCell.self, forCellWithReuseIdentifier: "CatCell")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "EmptyCell")
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.totalCount
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CatCell", for: indexPath) as? CatCollectionCell {
            cell.model = viewModel.cat(at: indexPath.item)
            cell.composeViews()
            return cell
        } else if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EmptyCell", for: indexPath) as? UICollectionViewCell {
            return cell
        }
        fatalError()
    }
    
    func setCollectionItemSize() {
        if UIScreen.main.bounds.width > UIScreen.main.bounds.height {
            (collectionView.collectionViewLayout as? CatsLayout)?.itemSize = CGSize(width: UIScreen.main.bounds.height / 2, height: UIScreen.main.bounds.height / 2)
        } else {
            (collectionView.collectionViewLayout as? CatsLayout)?.itemSize = CGSize(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.width / 2)
        }
        
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        setCollectionItemSize()
    }
}

extension ViewController: CatsViewModelDelegate {
    func onFetchCompleted(with newIndexPathsToReload: [IndexPath]?) {
        // 1
        guard let newIndexPathsToReload = newIndexPathsToReload else {
            //      indicatorView.stopAnimating()
            collectionView.isHidden = false
            collectionView.reloadData()
            return
        }
        // 2
        let indexPathsToReload = visibleIndexPathsToReload(intersecting: newIndexPathsToReload)
        collectionView.reloadItems(at: indexPathsToReload)
    }
    
    func onFetchFailed(with reason: String) {
        //    indicatorView.stopAnimating()
        
        let title = "Warning"
        let action = UIAlertAction(title: "OK", style: .default)
        //    displayAlert(with: title , message: reason, actions: [action])
    }
}


extension ViewController: UICollectionViewDataSourcePrefetching {
    
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        viewModel.fetchCats()
    }
}

private extension ViewController {
    
    func isLoadingCell(for indexPath: IndexPath) -> Bool {
        return indexPath.row >= viewModel.currentCount
    }
    
    func visibleIndexPathsToReload(intersecting indexPaths: [IndexPath]) -> [IndexPath] {
        let indexPathsForVisibleRows = collectionView.indexPathsForVisibleItems ?? []
        let indexPathsIntersection = Set(indexPathsForVisibleRows).intersection(indexPaths)
        return Array(indexPathsIntersection)
    }
}

