//
//  ReadFile.swift
//  SwiftyProteins
//
//  Created by Naledi MATUTOANE on 2019/12/10.
//  Copyright © 2019 Naledi MATUTOANE. All rights reserved.
//

import Foundation

class ReadFile {
    class func readFile(fileName: String, fileExt: String) {
        if let dir = Bundle.main.path(forResource: fileName, ofType: fileExt) {
            do {
                let fileURL = URL(fileURLWithPath: dir)
                let textRead = try String(contentsOf: fileURL, encoding: .utf8)
                let contents = textRead.components(separatedBy: .newlines)
                
                for line in contents {
                    if (line.count > 1) {
                        Ligands.list.append(line)
                    }
                }
            }
            catch {
                print("Error: \(error)")
            }
        }
        else {
            print("File not found")
        }
    }
}
