//
//  MasterViewController.swift
//  Papers
//
//  Created by Pedro Ruíz on 12/3/15.
//  Copyright © 2015 Pedro Ruíz. All rights reserved.
//

import UIKit

class MasterViewController: UICollectionViewController {
    private var papersDataSource = PapersDataSource()
    
    //MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        let picturesPerRow = CGFloat(3)
        let width = CGRectGetWidth(collectionView!.frame) / picturesPerRow
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "MasterToDetail" {
            let detailViewController = segue.destinationViewController as! DetailViewController
            detailViewController.paper = sender as? Paper
        }
    }
    
    
    //MARK: - UICollectionViewDataSource
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return papersDataSource.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PaperCell", forIndexPath: indexPath) as UICollectionViewCell
        return cell
    }
    
    //MARK: - UIControllerViewDelegate
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        if let paper = papersDataSource .paperForItemAtIndexPath(indexPath) {
            performSegueWithIdentifier("MasterToDetail", sender: paper)
        }
    }
    
}
