//
//  ViewController.swift
//  UiAssignment
//
//  Created by Ishan Baboota on 05/08/16.
//  Copyright © 2016 Ishan Baboota. All rights reserved.
//

import UIKit

extension Array {
    func randomItem() -> Element {
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return self[index]
    }
}
class ViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {

    @IBOutlet var mycollect: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mycollect.reloadData()
        
        collectionView!.contentInset = UIEdgeInsets(top: 23, left: 5, bottom: 10, right: 5)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension ViewController {
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
       return 30
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 30
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CustomCell", forIndexPath: indexPath) as! NewCollectionViewCell
        cell.roundImage.image = UIImage(named: "cat1")
        cell.label.text = "Demo"
        return cell
    }
    
}
