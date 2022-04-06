//
//  ModulesViewController.swift
//  testCarbon
//
//  Created by User on 4/5/22.
//

import UIKit

enum countSize {
    case big,medium,small
}

class ModulesViewController: UIViewController {
    
    typealias DataSource = UICollectionViewDiffableDataSource<Section, List>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, List>
    
    private lazy var dataSource = makeDataSource()

    @IBOutlet var myCollectionView: UICollectionView!
    
    private var listModule = List.allList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nibCell = UINib(nibName: "ModuleListCell", bundle: nil)
        myCollectionView.register(nibCell, forCellWithReuseIdentifier: "cell")
        configureLayout()
        applySnapshot(animatingDifferences: false)
        
    }
    
    func makeDataSource() -> DataSource {
      let dataSource = DataSource(
        collectionView: myCollectionView,
        cellProvider: { (collectionView, indexPath, module) ->
          UICollectionViewCell? in
          let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "cell",
            for: indexPath) as? ModuleListCell
            cell?.lblName.text = module.name
            cell?.btnModule.setImage(module.image, for: .normal)
          return cell
      })
      return dataSource
    }
    
    func applySnapshot(animatingDifferences: Bool = true) {
            var snapshot = Snapshot()
            
            snapshot.appendSections([.main])
            
            snapshot.appendItems(listModule)
            
            dataSource.apply(snapshot, animatingDifferences: animatingDifferences)
    }

}

extension ModulesViewController {

  private func configureLayout() {
    myCollectionView.collectionViewLayout = UICollectionViewCompositionalLayout(sectionProvider: { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
        var isPhone = layoutEnvironment.traitCollection.userInterfaceIdiom == UIUserInterfaceIdiom.phone
        var isTablet = layoutEnvironment.traitCollection.userInterfaceIdiom == UIUserInterfaceIdiom.pad
        
        let size = NSCollectionLayoutSize(
          widthDimension: NSCollectionLayoutDimension.fractionalWidth(1),
          heightDimension: NSCollectionLayoutDimension.absolute(isPhone ? 250 : 200)
        )
        let itemCount = isPhone ? 1 : 6
        
        let item = NSCollectionLayoutItem(layoutSize: size)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: size, subitem: item, count: itemCount)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        section.interGroupSpacing = 10
        
        func compactPositions(countsize: countSize){
            switch countsize {
            case .big:
                isPhone = UITraitCollection().isCompact
            case .medium:
                isTablet = UIView().isLandscapePhone
            case .small:
                isTablet = UITraitCollection().isCompact
            }
        }
     
      return section
    })
  }
    
  
}

extension ModulesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        _ = listModule[indexPath.row]
    }
}
