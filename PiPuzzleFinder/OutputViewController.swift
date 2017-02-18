//
//  OutputViewController.swift
//  PiPuzzleFinder
//
//  Created by Dennis Franke on 08.02.17.
//  Copyright © 2017 Dennis Franke. All rights reserved.
//

import UIKit

class OutputViewController : UIViewController {
    
    @IBOutlet weak var imgView: HighlightedImageView!
    
    var finder = PiFinder()
    var result: [Origin]?
    
    var input: [String]! {
        didSet{
            result = PiFinder().findOrigins(toFind: input)
        }
    }
    
    override func viewDidLoad() {
        imgView.origins = result
    }
}
