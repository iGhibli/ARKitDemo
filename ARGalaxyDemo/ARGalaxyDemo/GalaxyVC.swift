//
//  GalaxyVC.swift
//  ARGalaxyDemo
//
//  Created by 周帅杰 on 2017/7/28.
//  Copyright © 2017年 iGhibli. All rights reserved.
//

import UIKit
import ARKit
import SceneKit

class GalaxyVC: UIViewController, ARSCNViewDelegate, ARSessionDelegate {
    // AR视图：展示3D界面
    @IBOutlet weak var arSCNView: ARSCNView!

    // Node对象
    var sunNode: SCNNode!
    var earthNode: SCNNode!
    var moonNode: SCNNode!
    var marsNode: SCNNode! // 火星
    var mercuryNode: SCNNode! // 水星
    var venusNode: SCNNode! // 金星
    var jupiterNode: SCNNode! //木星
    var jupiterLoopNode: SCNNode!//木星环
    var saturnNode: SCNNode!//土星
    var saturnLoopNode: SCNNode!//土星环
    var sartunGruopNode: SCNNode!//土星Group
    var uranusNode: SCNNode!//天王星
    var uranusLoopNode: SCNNode!//天王星环
    var uranusGroupNode: SCNNode!//天王星Group
    var neptuneNode: SCNNode!//海王星
    var neptuneLoopNode: SCNNode!//海王星环
    var neptuneGroupNode: SCNNode!//海王星Group
    var plutoNode: SCNNode!//冥王星
    var earthGroupNode: SCNNode!
    var sunHaloNode: SCNNode!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // 绑定SCNView的session
        self.arSCNView.session = self.arSession
        // 自适应环境光照度，过度更平滑
        self.arSCNView.automaticallyUpdatesLighting = true
        // 初始化节点
        self.initNode()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.arSCNView.session.run(self.arSessionConfiguration)
    }
    
    func initNode() {
        self.sunNode = SCNNode.init()
        // 设置sunNode的几何形状为球型，并设置半径
        self.sunNode.geometry = SCNSphere.init(radius: 0.5)
        // 太阳贴图
        self.sunNode.geometry?.firstMaterial?.multiply.contents = "art.scnassets/earth/sun.jpg"
        self.sunNode.geometry?.firstMaterial?.diffuse.contents = "art.scnassets/earth/sun.jpg"
        self.sunNode.geometry?.firstMaterial?.multiply.intensity = 0.5
        self.sunNode.geometry?.firstMaterial?.lightingModel = SCNMaterial.LightingModel.constant
        self.sunNode.geometry?.firstMaterial?.multiply.wrapS = SCNWrapMode.repeat
        self.sunNode.geometry?.firstMaterial?.diffuse.wrapS = SCNWrapMode.repeat
        self.sunNode.geometry?.firstMaterial?.multiply.wrapT = SCNWrapMode.repeat
        self.sunNode.geometry?.firstMaterial?.diffuse.wrapT = SCNWrapMode.repeat
        // 设置Node的三维坐标
        self.sunNode.position = SCNVector3Make(0, -5, -10)
        // 将sunNode节点添加到scene中
        self.arSCNView.scene.rootNode.addChildNode(self.sunNode)
        
        
        
//        self.mercuryNode = SCNNode.init()
//        self.venusNode = SCNNode.init()
//        self.earthNode = SCNNode.init()
//        self.moonNode = SCNNode.init()
//        self.marsNode = SCNNode.init()
//        self.earthGroupNode = SCNNode.init()
//        self.jupiterNode = SCNNode.init()
//        self.saturnNode = SCNNode.init()
//        self.sartunGruopNode = SCNNode.init()
//        self.uranusNode = SCNNode.init()
//        self.neptuneNode = SCNNode.init()
//        self.plutoNode = SCNNode.init()
        
        
//        self.mercuryNode.geometry = SCNSphere.init(radius: 0.02)
//        self.venusNode.geometry = SCNSphere.init(radius: 0.04)
//        self.marsNode.geometry = SCNSphere.init(radius: 0.03)
//        self.earthNode.geometry = SCNSphere.init(radius: 0.05)
//        self.moonNode.geometry = SCNSphere.init(radius: 0.01)
//        self.jupiterNode.geometry = SCNSphere.init(radius: 0.15)
//        self.saturnNode.geometry = SCNSphere.init(radius: 0.12)
//        self.uranusNode.geometry = SCNSphere.init(radius: 0.09)
//        self.neptuneNode.geometry = SCNSphere.init(radius: 0.08)
//        self.plutoNode.geometry = SCNSphere.init(radius: 0.04)
        
        
    }
    
    // 懒加载
    private lazy var arSession: ARSession = {
        // AR会话：负责管理相机追踪配置及3D相机坐标
        let tempARSession = ARSession.init()
        print("ARSession懒加载，只走一次。")
        return tempARSession
    }()
    
    private lazy var arSessionConfiguration: ARSessionConfiguration = {
        // 会话追踪配置
        // 1.创建世界追踪会话配置（使用ARWorldTrackingSessionConfiguration效果更加好），需要A9芯片支持
        let tempARSConfiguration = ARWorldTrackingSessionConfiguration.init()
        // 2.设置追踪方向（追踪平面，后面会用到）
        tempARSConfiguration.planeDetection = ARWorldTrackingSessionConfiguration.PlaneDetection.horizontal
        // 3.自适应灯光（相机从暗到强光快速过渡效果会平缓一些）
        tempARSConfiguration.isLightEstimationEnabled = true
        
        return tempARSConfiguration
    }()
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
