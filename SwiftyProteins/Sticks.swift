//
//  Sticks.swift
//  SwiftyProteins
//
//  Created by Naledi MATUTOANE on 2019/12/13.
//  Copyright © 2019 Naledi MATUTOANE. All rights reserved.
//

import Foundation
import SceneKit

class Sticks {
    class func midpoint(start: SCNVector3, end: SCNVector3) -> SCNVector3 {
        let midpoint = SCNVector3((start.x + end.x) / 2, (start.y + end.y) / 2, (start.z + end.z) / 2)
        
        return midpoint
    }
    
    class func normaliseVector(_ iv: SCNVector3) -> SCNVector3 {
        let length = sqrt(iv.x * iv.x + iv.y * iv.y + iv.z * iv.z)
        
        if length == 0 {
            return SCNVector3(0.0, 0.0, 0.0)
        }

        return SCNVector3(iv.x / length, iv.y / length, iv.z / length)
    }
    
    class func positionStick(cylinder: SCNCylinder, length: Float, start: SCNVector3, end: SCNVector3, molecule: SCNNode) -> SCNNode {
        let node = SCNNode(geometry: cylinder)
        let original = SCNVector3(0, length / 2.0, 0)
        let new = SCNVector3((end.x - start.x) / 2.0, (end.y - start.y) / 2.0, (end.z - start.z)/2.0)
        let axis = midpoint(start: original, end: new)
        let normalisedAxis = normaliseVector(axis)
        let q0 = Float(0.0) // cos(angle/2), angle is always 180 or Double.pi
        let q1 = Float(normalisedAxis.x) // x' * sin(angle/2)
        let q2 = Float(normalisedAxis.y) // y' * sin(angle/2)
        let q3 = Float(normalisedAxis.z) // z' * sin(angle/2)

        let r_m11 = q0 * q0 + q1 * q1 - q2 * q2 - q3 * q3
        let r_m12 = 2 * q1 * q2 + 2 * q0 * q3
        let r_m13 = 2 * q1 * q3 - 2 * q0 * q2
        let r_m21 = 2 * q1 * q2 - 2 * q0 * q3
        let r_m22 = q0 * q0 - q1 * q1 + q2 * q2 - q3 * q3
        let r_m23 = 2 * q2 * q3 + 2 * q0 * q1
        let r_m31 = 2 * q1 * q3 + 2 * q0 * q2
        let r_m32 = 2 * q2 * q3 - 2 * q0 * q1
        let r_m33 = q0 * q0 - q1 * q1 - q2 * q2 + q3 * q3

        node.transform.m11 = r_m11
        node.transform.m12 = r_m12
        node.transform.m13 = r_m13
        node.transform.m14 = 0.0

        node.transform.m21 = r_m21
        node.transform.m22 = r_m22
        node.transform.m23 = r_m23
        node.transform.m24 = 0.0

        node.transform.m31 = r_m31
        node.transform.m32 = r_m32
        node.transform.m33 = r_m33
        node.transform.m34 = 0.0

        node.transform.m41 = (start.x + end.x) / 2.0
        node.transform.m42 = (start.y + end.y) / 2.0
        node.transform.m43 = (start.z + end.z) / 2.0
        node.transform.m44 = 1.0
              
        molecule.addChildNode(node)
        
        return node
    }
    
    class func distance(start: SCNVector3, end: SCNVector3) -> Float {
        let x = end.x - start.x
        let y = end.y - start.y
        let z = end.z - start.z
        let length = (x.square() + y.square() + z.square()).squareRoot()
        
        return (length)
    }
    
    class func stick(start: SCNVector3, end: SCNVector3) -> SCNGeometry {
        let stick = SCNCylinder(radius: 0.05, height: CGFloat(distance(start: start, end: end)))
        
        stick.firstMaterial!.diffuse.contents = UIColor.gray
        stick.firstMaterial!.specular.contents = UIColor.white
        
        return stick
    }
}

extension Float {
    func square() -> Float {
        return (self * self)
    }
}
