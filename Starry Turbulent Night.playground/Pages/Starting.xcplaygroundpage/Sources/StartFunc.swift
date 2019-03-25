import PlaygroundSupport
import SpriteKit

public func startExploration() {
    let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 1024, height: 768))
    if let scene = StartScene(fileNamed: "StartScene") {
        scene.scaleMode = .aspectFill
        sceneView.presentScene(scene)
    }
    PlaygroundSupport.PlaygroundPage.current.liveView = sceneView
}

