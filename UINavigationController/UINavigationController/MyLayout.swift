//
//  MyLayout.swift
//  UINavigationController
//
//  Created by 衰公 on 2018/9/6.
//  Copyright © 2018年 chrisz. All rights reserved.
//

import UIKit

class MyLayout: UICollectionViewFlowLayout {

    var itemCount:Int?
    var attributeArray:Array<UICollectionViewLayoutAttributes>?
    override func prepare() {
        super.prepare()
        attributeArray = Array<UICollectionViewLayoutAttributes>()
        let WIDTH = (UIScreen.main.bounds.size.width-self.sectionInset.left-self.sectionInset.right-self.minimumInteritemSpacing)/2
        var colHeight = Array<CGFloat>()
        colHeight.append(self.sectionInset.top)
        colHeight.append(self.sectionInset.top)
        for index in 0..<itemCount!{
            let indexPath = IndexPath(item: index, section: 0)
            let attris = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            let height = arc4random()%150+40
            var width = 0
            if colHeight[0]<colHeight[1]{
                colHeight[0] = colHeight[0] + CGFloat(height) + self.minimumLineSpacing
                width = 0
            } else{
                colHeight[1] = colHeight[1] + CGFloat(height) + self.minimumLineSpacing
                width = 1
            }
            attris.frame = CGRect(x: self.sectionInset.left + (self.minimumInteritemSpacing+WIDTH) * CGFloat(width), y: colHeight[width]-CGFloat(height)-self.minimumLineSpacing, width: WIDTH, height: CGFloat(height))
            attributeArray?.append(attris)
        }
        if colHeight[0]>colHeight[1]{
            self.itemSize = CGSize(width: WIDTH, height: (colHeight[0]-self.sectionInset.top)*2/CGFloat(itemCount!)-self.minimumLineSpacing)
        } else{
            self.itemSize = CGSize(width: WIDTH, height: (colHeight[1]-self.sectionInset.top)*2/CGFloat(itemCount!)-self.minimumLineSpacing)
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return attributeArray!
    }
}
