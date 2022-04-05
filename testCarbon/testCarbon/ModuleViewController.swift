//
//  ModuleViewController.swift
//  testCarbon
//
//  Created by User on 4/4/22.
//

import UIKit

class ModuleViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var listModule = List.allList()
    
    @IBOutlet var myCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nibCell = UINib(nibName: "ModuleCell", bundle: nil)
        myCollectionView.register(nibCell, forCellWithReuseIdentifier: "cell")
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listModule.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let list = listModule[indexPath.row]
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ModuleCell
        cell.lblName.text = list.name
        cell.btnModule.setImage(list.image, for: .normal)
      
        return cell
        
    }

}

extension ModuleViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset:CGFloat = 10
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
}
