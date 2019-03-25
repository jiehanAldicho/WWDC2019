import PlaygroundSupport
import SpriteKit

public func startPainting(with pref: PaintingPreference)  {
    let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 1024, height: 768))
    
    if let drawingScene = MainScene(fileNamed: "MainScene", preference: pref) {
        drawingScene.scaleMode = .aspectFill
        sceneView.presentScene(drawingScene)
    }
    
    PlaygroundSupport.PlaygroundPage.current.liveView = sceneView
}
