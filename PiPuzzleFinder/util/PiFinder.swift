//
//  PiFinder.swift
//  PiPuzzleFinder
//
//  Created by Dennis Franke on 08.02.17.
//  Copyright © 2017 Dennis Franke. All rights reserved.
//

import Foundation

class PiFinder {
    
    fileprivate var pi: NSString!
    fileprivate var charPerLine: Int = 350
    
    fileprivate var piLength: Int!
    
    fileprivate var numberOfLines: Int {
        get {
            return Int(ceil(Float(piLength) / Float(charPerLine)))
        }
    }
    
    init() {
        if let path = Bundle.main.path(forResource: "pi", ofType: "txt") {
            do {
                pi = try String(contentsOfFile: path) as NSString
                piLength = pi.length
            } catch {
                pi = ""
                print(error)
            }
        }
    }
    
    func findOrigins(toFind: [String]) -> [Origin] {
        var result = [Origin]()
        
        for l in 0..<numberOfLines {
            let line: NSString = getLine(line: l)
            
            
            var searchRange = NSMakeRange(0, line.length)
            var charRange = line.range(of: toFind[0], options: [], range: searchRange)
            while charRange.location != NSNotFound {
                
                if doLinesContainString(toFind: toFind, startLine: l, charPos: charRange.location) {
                    let origin = Origin()
                    origin.lineInImage = Double(l) / Double(numberOfLines)
                    origin.charInImage = Double(charRange.location) / Double(charPerLine)
                    origin.resultWidth = Double((toFind[0] as NSString).length) / Double(charPerLine)
                    origin.resultHeight = Double(toFind.count) / Double(numberOfLines)
                    result.append(origin)
                }
                
                searchRange = NSMakeRange(charRange.location + 1, line.length - charRange.location - 1)
                charRange = line.range(of: toFind[0], options: [], range: searchRange)
            }
        }
        
        return result
    }
    
    fileprivate func doLinesContainString(toFind: [String], startLine: Int, charPos: Int) -> Bool {
        for l in 0..<toFind.count {
            let line = getLine(line: startLine + l)
            let length = (toFind[l] as NSString).length
            
            if  charPos + length >= line.length || line.substring(with: NSMakeRange(charPos, length)) != toFind[l] {
                return false;
            }
        }
        return true;
    }
    
    func getLine(line: Int) -> NSString {
        let startIndex = line * charPerLine
        let endIndex = min(piLength, (line + 1) * charPerLine)
        return pi.substring(with: NSMakeRange(startIndex, endIndex - startIndex)) as NSString
    }
}
