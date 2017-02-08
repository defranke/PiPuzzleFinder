//
//  PiFinder.swift
//  PiPuzzleFinder
//
//  Created by Dennis Franke on 08.02.17.
//  Copyright © 2017 Dennis Franke. All rights reserved.
//

import Foundation

class PiFinder {
    
    fileprivate var pi: String!
    fileprivate var charPerLine: Int = 500
    
    fileprivate var piLength: Int {
        get {
            return pi.lengthOfBytes(using: String.Encoding.ascii)
        }
    }
    
    fileprivate var numberOfLines: Int {
        get {
            return Int(ceil(Float(piLength) / Float(charPerLine)))
        }
    }
    
    init() {
        // Load PI
        if let path = Bundle.main.path(forResource: "pi", ofType: "txt") {
            do {
                pi = try String(contentsOfFile: path)
            } catch {
                pi = ""
                print(error)
            }
        }
    }
    
    func findOrigins(toFind: [String]) -> [Origin] {
        var result = [Origin]()
        
        for l in 0..<toFind.count {
            print(toFind[l])
        }
        
        return result
    }
}
