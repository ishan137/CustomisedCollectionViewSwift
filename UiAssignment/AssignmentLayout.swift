//
//  AssignmentLayout.swift
//  UiAssignment
//
//  Created by Ishan Baboota on 05/08/16.
//  Copyright © 2016 Ishan Baboota. All rights reserved.
//

import UIKit

class AssignmentLayoutAttributes:UICollectionViewLayoutAttributes {
    
    // 1. Custom attribute
   // var imgHeight: CGFloat = 0.0
}

class AssignmentLayout: UICollectionViewLayout, UICollectionViewDelegateFlowLayout {
    
    var layout : AssignmentLayout!
    var numberOfColumns = 2
    var cellPadding: CGFloat = 4.0
    private var cache = [AssignmentLayoutAttributes]()
    
    private var contentHeight:CGFloat = 0.0 /*{
        let insets = collectionView!.contentInset
        return CGRectGetHeight(collectionView!.bounds) - (insets.left + insets.right)
    }*/

    private var contentWidth: CGFloat {
        let insets = collectionView!.contentInset
        return CGRectGetWidth(collectionView!.bounds) - (insets.left + insets.right)
    }

    override func prepareLayout() {
        let columnWidth = contentWidth / CGFloat(numberOfColumns)
        var xOffset = [CGFloat]()
        var column = 0
        var yOffset = [CGFloat]()
        yOffset = [0,40]//(count: numberOfColumns, repeatedValue: 0)
       /* for column in 0 ..< numberOfColumns {
            yOffset.append(CGFloat(column) * columnWidth )
        }*/
        
        var realHeight = [CGFloat]()
        realHeight = [160,140,120]
        for check in 0 ..< (collectionView!.numberOfItemsInSection(0)-3){
            realHeight.append(realHeight[check])
        }
        var realWidth : CGFloat!
        var counter = 0
        for item in 0 ..< collectionView!.numberOfItemsInSection(0){
            let indexPath = NSIndexPath(forItem: item, inSection: 0)
            
            // random spacing between cells in a row
            for column in 0 ..< numberOfColumns {
                let xDiff: [CGFloat] = [16.0, 30.0, 1.0]
                var randum : CGFloat {
                    get {
                        return xDiff.randomItem()
                    }
                }
                
                var z = randum
                xOffset.append((CGFloat(column) * columnWidth) + z )
            }

            realWidth = realHeight[item]
            let width = columnWidth - cellPadding*2
            let height = realWidth
            let frame = CGRect(x: xOffset[column], y: yOffset[column], width: realWidth, height: height)
            let insetFrame = CGRectInset(frame, cellPadding, cellPadding)
            
            // Creates an UICollectionViewLayoutItem with the frame and add it to the cache
            let attributes = AssignmentLayoutAttributes(forCellWithIndexPath: indexPath)
            attributes.frame = frame
            cache.append(attributes)
            
            //  Updates the collection view content height
            contentHeight = max(contentHeight, CGRectGetMaxY(frame))
            var heightObserver = item
            print("number", collectionView!.numberOfItemsInSection(0))
            if item ==  collectionView!.numberOfItemsInSection(0)-1 {
                heightObserver = item-1
            }
            let chuck = heightObserver + 1
            //let net = realHeight[chuck]

            if column == 0 {
            yOffset[column] = yOffset[column] + height + (realHeight[chuck]/4)
            }
            else {
                yOffset[column] = yOffset[column] + height + (realHeight[chuck]/4)
            }

            column = column >= (numberOfColumns - 1) ? 0 : ++column
            xOffset.removeAll()
        }
    }
    

    override func collectionViewContentSize() -> CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    override func shouldInvalidateLayoutForPreferredLayoutAttributes(preferredAttributes: UICollectionViewLayoutAttributes, withOriginalAttributes originalAttributes: UICollectionViewLayoutAttributes) -> Bool {
        return false
    }
    
    override func layoutAttributesForElementsInRect(_ rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        var layoutAttributes = [UICollectionViewLayoutAttributes]()
        //invalidateLayout()
        // Loop through the cache and look for items in the rect
        for attributes  in cache {
            //print("check attribute")
            if CGRectIntersectsRect(attributes.frame, rect ) {
                layoutAttributes.append(attributes)
            }
        }
        return layoutAttributes
    }
    
}
