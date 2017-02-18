//
//  HighlightedImageView.swift
//  PiPuzzleFinder
//
//  Created by Dennis Franke on 09.02.17.
//  Copyright © 2017 Dennis Franke. All rights reserved.
//

import UIKit

class HighlightedImageView : UIView {
    
    var origins: [Origin]?
    
    override func draw(_ rect: CGRect) {
        
        let bgImg = UIImage(contentsOfFile: Bundle.main.path(forResource: "background", ofType: "jpg")!)
        bgImg!.draw(in: rect)
        
        if let origins = origins {
            for o in origins {
                
                let path = UIBezierPath(rect: CGRect(x: CGFloat(o.charInImage) * rect.width,
                                                     y: CGFloat(o.lineInImage) * rect.height,
                                                     width: CGFloat(o.resultWidth) * rect.width,
                                                     height: CGFloat(o.resultHeight) * rect.height))
                UIColor.red.setFill()
                UIColor.red.setStroke()
                path.stroke()
            }
        }
        
        
    }
}
