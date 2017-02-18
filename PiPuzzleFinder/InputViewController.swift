//
//  InputViewController.swift
//  PiPuzzleFinder
//
//  Created by Dennis Franke on 08.02.17.
//  Copyright © 2017 Dennis Franke. All rights reserved.
//

import UIKit

class InputViewController : UIViewController {
    
    @IBOutlet weak var inputField: UITextView!
    @IBOutlet weak var searchButton: UIButton!
    
    override func viewDidLoad() {
        searchButton.isEnabled = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        inputField.becomeFirstResponder()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showOutput" {
            let vc = segue.destination as! OutputViewController
            vc.input = inputField.text.components(separatedBy: .newlines)
        }
    }
}


extension InputViewController : UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        searchButton.isEnabled = !textView.text.isEmpty
    }
}
