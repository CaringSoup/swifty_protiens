//
//  Molecules.swift
//  SwiftyProteins
//
//  Created by Naledi MATUTOANE on 2019/12/11.
//  Copyright © 2019 Naledi MATUTOANE. All rights reserved.
//

import Foundation
import SceneKit

class Molecules {
    class func atomNode(object: SCNGeometry, molecule: SCNNode, position: SCNVector3?) -> SCNNode {
        let node = SCNNode(geometry: object)
            
        node.position = position!
        molecule.addChildNode(node)
        
        return node
    }
    
    class func createMolecule(atoms: [(Int, (Float, Float, Float), String)]) -> SCNNode {
        let molecule = SCNNode()
        molecule.position = SCNVector3(0.5, 0.5, 0)
        molecule.name = "Molecule"
        
        for element in atoms {
            _ = Atoms.positionAtom(atom: Atoms.atom(name: element.2) as! SCNSphere, molecule: molecule, position: SCNVector3(element.1.0, element.1.1, element.1.2))
        }
        
        for connection in Structure.connections {
            let start = SCNVector3(connection[0].0, connection[0].1, connection[0].2)
            for coords in connection {
                let end = SCNVector3(coords.0, coords.1, coords.2)
                _ = Sticks.positionStick(cylinder: Sticks.stick(start: start, end: end) as! SCNCylinder, length: Sticks.distance(start: start, end: end), start: start, end: end, molecule: molecule)
            }
        }
        
        return molecule
    }
    
    class func constructLigand(contents: [String]) -> SCNNode {
        var atoms: [(Int, (Float, Float, Float), String)] = []
        
        for atom in contents {
            let trimmed = atom.condenseWhitespace()
            var row = trimmed.components(separatedBy: "\t")
            if row[0] == "ATOM" {
                atoms.append((Int(row[1])!, (Float(row[6])!, Float(row[7])!, Float(row[8])!), row.last!))
                Structure.atoms.append(((Int(row[1])!, (Float(row[6])!, Float(row[7])!, Float(row[8])!))))
            }
            if (row[0] == "CONECT") {
                row.remove(at: 0)
                let ints = row.map { Int($0) }
                var connections: [(Float, Float, Float)] = []
                for int in ints {
                    let i = Structure.atoms.firstIndex(where: { $0.0 == int })!
                    connections.append(Structure.atoms[i].1)
                }
                Structure.connections.append(connections)
            }
        }
        return (self.createMolecule(atoms: atoms))
    }
}

extension String {
    func condenseWhitespace() -> String {
        let components = self.components(separatedBy: .whitespacesAndNewlines)
        return components.filter { !$0.isEmpty }.joined(separator: "\t")
    }
}
