//
//  homeVC.swift
//  daraz
//
//  Created by Tipu on 23/10/23.
//

import UIKit

class homeVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionview: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    let images = [UIImage(named: "a1"),
                  UIImage(named: "a2"),
                  UIImage(named: "a3"),
                  UIImage(named: "a4"),
                  UIImage(named: "a5"),
                  UIImage(named: "a6"),]
    var autoScrollTimer: Timer?
    var currentcellindex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionview.dataSource = self
        collectionview.delegate = self
        
        pageControl.numberOfPages = images.count
        startAutoScrollTimer()
    }
    //MARK: AUTO-SCROLL
    func startAutoScrollTimer(){
        autoScrollTimer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(slideToNext) , userInfo: nil, repeats: true)
    }
    @objc func slideToNext(){
        if currentcellindex < images.count-1 {
            
            currentcellindex += 1
        }
        else{
            currentcellindex = 0
        }
        
        collectionview.scrollToItem(at: IndexPath(item: currentcellindex, section: 0), at: .right, animated: true)
        pageControl.currentPage = currentcellindex
    }
    
    //MARK: TOP-COLLECTION-VIEW
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! topCollectionViewCell
        
        cell.topImageView.image = images[indexPath.row]
        cell.topImageView.contentMode = .scaleAspectFill
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let collectionviewWidth = collectionview.bounds.width
        let collectionviewHeight = collectionview.bounds.height
        
        return CGSize(width: collectionviewWidth, height: collectionviewHeight)
    }
}
