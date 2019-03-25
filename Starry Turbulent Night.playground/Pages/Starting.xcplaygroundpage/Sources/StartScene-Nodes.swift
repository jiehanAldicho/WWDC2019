import AppKit
import SpriteKit

extension StartScene {
    func setupNodes() {
        self.setupSkyNode()
        self.setupSceneryNode()
        self.setupTreeNode()
    }
    
    private func setupTreeNode() {
        treeNode = SKSpriteNode(imageNamed: "1_tree")
        treeNode.anchorPoint = .zero
        treeNode.size = CGSize(width: 485.8056, height: 761.20)
        treeNode.position = CGPoint(x: -3, y: treeNode.position.y)
        
        let treeBlurFilter = CIFilter(name:"CIGaussianBlur")
        treeBlurFilter!.setValue(0, forKey: "inputRadius")
        treeEffect.filter = treeBlurFilter
        treeEffect.addChild(treeNode)
        
        self.addChild(treeEffect)
    }
    
    private func setupSceneryNode() {
        sceneryNode = SKSpriteNode(imageNamed: "2_scenery")
        sceneryNode.anchorPoint = .zero
        sceneryNode.size = CGSize(width: 1020.6, height: 400.68)
        
        let sceneryBlurFilter = CIFilter(name:"CIGaussianBlur")
        sceneryBlurFilter!.setValue(5, forKey: "inputRadius")
        sceneryEffect.filter = sceneryBlurFilter
        sceneryEffect.addChild(sceneryNode)
        
        
        self.addChild(sceneryEffect)
    }
    
    private func setupSkyNode() {
        skyNode = SKSpriteNode(imageNamed: "3_sky")
        skyNode.anchorPoint = .zero
        skyNode.size = CGSize(width: 1020.6, height: 764.64)
        
        
        let skyBlurFilter = CIFilter(name:"CIGaussianBlur")
        skyBlurFilter!.setValue(5, forKey: "inputRadius")
        skyEffect.filter = skyBlurFilter
        skyEffect.addChild(skyNode)
        
        
        self.addChild(skyEffect)
    }
}
