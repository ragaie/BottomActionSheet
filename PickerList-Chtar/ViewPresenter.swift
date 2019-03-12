//
//  ViewPresenter.swift
//  PickerList-Chtar
//
//  Created by Ragaie alfy on 1/14/18.
//  Copyright © 2018 Ragaie alfy. All rights reserved.
//

import UIKit

class ViewPresenter: NSObject ,UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
  

    
    
    
    weak var myView : ViewController!
    override init() {
        
        super.init()
    }

    
    
    /// table view dataSource and Collection
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        print(indexPath)
        
        myView.customePicker.dismiss()
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellTableID", for: indexPath)
        return cell
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
   /// collectionView
    
  
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 17
        
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCellID", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        print(indexPath)
        myView.customePicker.dismiss()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       // let picDimension = self.myView.view.frame.size.width / 4.0
        return CGSize(width: 80, height: 95)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
       // let leftRightInset = self.myView.view.frame.size.width / 14.0
        
        return UIEdgeInsets.init(top: 2, left: 10, bottom: 2, right: 10)
    }
    
   
    
}
