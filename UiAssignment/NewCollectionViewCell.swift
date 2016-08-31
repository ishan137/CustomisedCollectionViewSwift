//
//  NewCollectionViewCell.swift
//  UiAssignment
//
//  Created by Ishan Baboota on 05/08/16.
//  Copyright © 2016 Ishan Baboota. All rights reserved.
//

import UIKit
//@IBDesignable
extension Array {
    func randomItem1() -> Element {
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return self[index]
    }
}
class NewCollectionViewCell: UICollectionViewCell, UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var roundImage: UIImageView!

    
    
    override var bounds : CGRect {
        didSet {
            self.layoutIfNeeded()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layoutIfNeeded()
        //print("check")
        self.makeCircle()
    }


    
    func makeCircle()
    {
       
        roundImage.layer.cornerRadius  = roundImage.bounds.size.width/2.0
        print("bounds", roundImage.bounds.size)
        print("width",roundImage.frame.size.width)
        print("radius",roundImage.layer.cornerRadius)
        print("height",roundImage.frame.size.height)
        self.roundImage.clipsToBounds = true

    }

}
