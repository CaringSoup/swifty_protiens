//
//  ViewController.swift
//  SwiftyProteins
//
//  Created by Naledi MATUTOANE on 2019/12/10.
//  Copyright © 2019 Naledi MATUTOANE. All rights reserved.
//

import UIKit
import SceneKit

class ModelViewController: UIViewController {
    @IBOutlet weak var sceneView: SCNView!
    @IBOutlet weak var element: UILabel!
    var scene: SCNScene!
    var model: SCNNode?
    var name: String!
    var camera: SCNNode?
    var angleX = Float(0.0)
    var angleY = Float(0.0)
    
    @IBAction func share(_ sender: Any) {
        let screenshot = sceneView.snapshot()
        let items = [screenshot]
        let ac = UIActivityViewController(activityItems: items as [Any], applicationActivities: nil)
        present(ac, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        self.navigationItem.title = name
        createScene()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        Structure.atoms = []
        Structure.connections = []
    }
    
    func createScene() {
        scene = SCNScene()
        camera = SCNNode()
        
        let ambientLightNode = SCNNode()
        let omniLightNode = SCNNode()
//        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panGesture(gesture:)))
//        let pinchRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(pinchGesture(gesture:)))
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapGesture(gesture:)))

        scene.rootNode.addChildNode(ambientLightNode)
        scene.rootNode.addChildNode(omniLightNode)
        scene.rootNode.addChildNode(camera!)
        scene.rootNode.addChildNode(model!)
//        sceneView.addGestureRecognizer(panRecognizer)
//        sceneView.addGestureRecognizer(pinchRecognizer)
        sceneView.addGestureRecognizer(tapRecognizer)
        
        ambientLightNode.light = SCNLight()
        ambientLightNode.light!.type = SCNLight.LightType.ambient
        ambientLightNode.light!.color = UIColor(white: 0.67, alpha: 1.0)
        omniLightNode.light = SCNLight()
        omniLightNode.light!.type = SCNLight.LightType.omni
        omniLightNode.light!.color = UIColor(white: 0.75, alpha: 1.0)
        omniLightNode.position = SCNVector3Make(0, 50, 50)
        camera!.camera = SCNCamera()
        camera!.position = SCNVector3Make(0.5, 0.5, 20)

        sceneView.allowsCameraControl = true
        sceneView.scene = scene
    }
    
//    @objc func panGesture(gesture: UIPanGestureRecognizer) {
//        let translation = gesture.translation(in: gesture.view!)
//        let touches = gesture.numberOfTouches
//        let maxY = Float(10.0)
//        let minY = Float(-10.0)
//        let maxX = Float(10.0)
//        let minX = Float(-10.0)
//        var newAngleX = (Float)(translation.y) * (Float)(Double.pi) / 180.0
//        var newAngleY = (Float)(translation.x) * (Float)(Double.pi) / 180.0
//        newAngleX += angleX
//        newAngleY += angleY
//
//        model!.eulerAngles.y = newAngleY
//        model!.eulerAngles.x = newAngleX
//
//
//        if gesture.state == UIGestureRecognizer.State.changed {
//            if (touches == 2) {
//                let point = CGPoint(x: translation.x, y: translation.y)
//
//                model!.position.x += Float(point.x)
//                model!.position.y += Float(point.y)
//
//                if model!.position.y >= maxY {
//                    model!.position.y = maxY
//                    print("MAX Y")
//                }
//                if model!.position.y <= minY {
//                    model!.position.y = minY
//                    print("MIN Y")
//                }
//                if model!.position.x >= maxX {
//                    model!.position.x = maxX
//                    print("MAX X")
//                }
//                if model!.position.x <= minX {
//                    model!.position.x = minX
//                    print("MIN X")
//                }
//                gesture.setTranslation(CGPoint.zero, in: gesture.view)
//            }
//        }
//
//        if gesture.state == UIGestureRecognizer.State.ended {
//            angleY = newAngleY
//            angleX = newAngleX
//        }
//    }
//
//    @objc func pinchGesture(gesture: UIPinchGestureRecognizer) {
//        let scale = gesture.velocity
//        let maximumFOV: CGFloat = 10.0
//        let minimumFOV: CGFloat = 150.0
//
//        if gesture.state == UIPinchGestureRecognizer.State.changed {
//            camera!.camera!.fieldOfView = camera!.camera!.fieldOfView - CGFloat(scale)
//            if camera!.camera!.fieldOfView <= maximumFOV {
//                camera!.camera!.fieldOfView = maximumFOV
//            }
//            if camera!.camera!.fieldOfView >= minimumFOV {
//                camera!.camera!.fieldOfView = minimumFOV
//            }
//        }
//    }
    
    @objc func tapGesture(gesture: UITapGestureRecognizer) {
        let location = gesture.location(in: sceneView)
        let results = sceneView!.hitTest(location, options: nil)
        
        for result in results {
            element.text = "Selected Element: \(result.node.geometry!.name!)"
        }
    }
}
