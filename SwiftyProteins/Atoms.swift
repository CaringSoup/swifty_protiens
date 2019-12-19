//
//  Atoms.swift
//  SwiftyProteins
//
//  Created by Naledi MATUTOANE on 2019/12/11.
//  Copyright © 2019 Naledi MATUTOANE. All rights reserved.
//

import Foundation
import SceneKit

class Atoms {
    class func atom(name: String) -> SCNGeometry {
        let atom: SCNSphere = SCNSphere(radius: 0.25)
        var diffuse: UIColor

        switch name {
        case "H":
            atom.name = "Hydrogen"
//            atom = SCNSphere(radius: 1.20)
            diffuse = UIColor.white
        case "C":
            atom.name = "Carbon"
//            atom = SCNSphere(radius: 1.70)
            diffuse = UIColor.black
        case "N":
            atom.name = "Nitrogen"
//            atom = SCNSphere(radius: 1.55)
            diffuse = UIColor.blue
        case "O":
            atom.name = "Oxygen"
//            atom = SCNSphere(radius: 1.52)
            diffuse = UIColor.red
        case "F":
            atom.name = "Fluorine"
//            atom = SCNSphere(radius: 1.47)
            diffuse = UIColor.green
        case "Cl":
            atom.name = "Chlorine"
//            atom = SCNSphere(radius: 1.75)
            diffuse = UIColor.green
        case "Br":
            atom.name = "Bromine"
//            atom = SCNSphere(radius: 1.85)
            diffuse = UIColor.init(red: 152.0, green: 35.0, blue: 13.0, alpha: 1.0)
        case "I":
            atom.name = "Iodine"
//            atom = SCNSphere(radius: 1.98)
            diffuse = UIColor.init(red: 102.0, green: 24.0, blue: 184.0, alpha: 1.0)
        case "He":
            atom.name = "Helium"
//            atom = SCNSphere(radius: 1.40)
            diffuse = UIColor.cyan
        case "Ne":
            atom.name = "Neon"
//            atom = SCNSphere(radius: 1.54)
            diffuse = UIColor.cyan
        case "Ar":
            atom.name = "Argon"
//            atom = SCNSphere(radius: 1.88)
            diffuse = UIColor.cyan
        case "Xe":
            atom.name = "Xenon"
//            atom = SCNSphere(radius: 2.16)
            diffuse = UIColor.cyan
        case "Kr":
            atom.name = "Krypton"
//            atom = SCNSphere(radius: 2.02)
            diffuse = UIColor.cyan
        case "P":
            atom.name = "Phosphorous"
//            atom = SCNSphere(radius: 1.80)
            diffuse = UIColor.orange
        case "S":
            atom.name = "Sulphur"
//            atom = SCNSphere(radius: 1.80)
            diffuse = UIColor.yellow
        case "B":
            atom.name = "Boron"
//            atom = SCNSphere(radius: 1.92)
            diffuse = UIColor.init(red: 257.0, green: 170.0, blue: 124.0, alpha: 1.0)
        case "V", "Cr", "Mn", "Co", "Ni", "Zr", "Nb", "Mo", "Tc", "Ru", "Rh", "Pd", "Hf", "Ta", "W", "Re", "Os", "Ir", "Pt", "Rf", "Db", "Sg", "Bh", "Hs":
            diffuse = UIColor.init(red: 257.0, green: 170.0, blue: 124.0, alpha: 1.0)
        case "Cu":
            atom.name = "Copper"
//            atom = SCNSphere(radius: 1.40)
            diffuse = UIColor.init(red: 257.0, green: 170.0, blue: 124.0, alpha: 1.0)
        case "Ag":
            atom.name = "Silver"
//            atom = SCNSphere(radius: 1.72)
            diffuse = UIColor.init(red: 257.0, green: 170.0, blue: 124.0, alpha: 1.0)
        case "Au":
            atom.name = "Gold"
//            atom = SCNSphere(radius: 1.66)
            diffuse = UIColor.init(red: 257.0, green: 170.0, blue: 124.0, alpha: 1.0)
        case "Li":
            atom.name = "Lithium"
//            atom = SCNSphere(radius: 1.82)
            diffuse = UIColor.init(red: 119.0, green: 37.0, blue: 251.0, alpha: 1.0)
        case "Na":
            atom.name = "Sodium"
//            atom = SCNSphere(radius: 2.27)
            diffuse = UIColor.init(red: 119.0, green: 37.0, blue: 251.0, alpha: 1.0)
        case "K":
            atom.name = "Potassium"
//            atom = SCNSphere(radius: 2.75)
            diffuse = UIColor.init(red: 119.0, green: 37.0, blue: 251.0, alpha: 1.0)
        case "Rb":
            atom.name = "Rubidium"
//            atom = SCNSphere(radius: 3.03)
            diffuse = UIColor.init(red: 119.0, green: 37.0, blue: 251.0, alpha: 1.0)
        case "Cs":
            atom.name = "Caesium"
//            atom = SCNSphere(radius: 3.43)
            diffuse = UIColor.init(red: 119.0, green: 37.0, blue: 251.0, alpha: 1.0)
        case "Fr":
            atom.name = "Francium"
//            atom = SCNSphere(radius: 3.48)
            diffuse = UIColor.init(red: 119.0, green: 37.0, blue: 251.0, alpha: 1.0)
        case "Be":
            atom.name = "Beryllium"
//            atom = SCNSphere(radius: 1.53)
            diffuse = UIColor.init(red: 13.0, green: 118.0, blue: 16.0, alpha: 1.0)
        case "Mg":
            atom.name = "Magnesium"
//            atom = SCNSphere(radius: 1.73)
            diffuse = UIColor.init(red: 13.0, green: 118.0, blue: 16.0, alpha: 1.0)
        case "Ca":
            atom.name = "Calcium"
//            atom = SCNSphere(radius: 2.31)
            diffuse = UIColor.init(red: 13.0, green: 118.0, blue: 16.0, alpha: 1.0)
        case "Sr":
            atom.name = "Strontium"
//            atom = SCNSphere(radius: 2.49)
            diffuse = UIColor.init(red: 13.0, green: 118.0, blue: 16.0, alpha: 1.0)
        case "Ba":
            atom.name = "Barium"
//            atom = SCNSphere(radius: 2.68)
            diffuse = UIColor.init(red: 13.0, green: 118.0, blue: 16.0, alpha: 1.0)
        case "Ra":
            atom.name = "Radium"
//            atom = SCNSphere(radius: 2.83)
            diffuse = UIColor.init(red: 13.0, green: 118.0, blue: 16.0, alpha: 1.0)
        case "Ti":
            atom.name = "Titanium"
            diffuse = UIColor.gray
        case "Fe":
            atom.name = "Iron"
            diffuse = UIColor.init(red: 219.0, green: 119.0, blue: 30.0, alpha: 1.0)
        default:
            diffuse = UIColor.init(red: 220.0, green: 124.0, blue: 252.0, alpha: 1.0)
        }
        
        atom.firstMaterial!.diffuse.contents = diffuse
        atom.firstMaterial!.specular.contents = UIColor.white
        
        return atom
    }
    
    class func positionAtom(atom: SCNSphere, molecule: SCNNode, position: SCNVector3) -> SCNNode {
        let node = SCNNode(geometry: atom)
        
        node.position = position
        molecule.addChildNode(node)
        
        return (node)
    }
}
