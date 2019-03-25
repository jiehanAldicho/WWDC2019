import AppKit
import SpriteKit

public class StartScene: SKScene {
    
    //Painting parts
    var treeNode: SKSpriteNode!
    var sceneryNode: SKSpriteNode!
    var skyNode: SKSpriteNode!
    //Effects
    var treeEffect : SKEffectNode = SKEffectNode()
    var sceneryEffect : SKEffectNode = SKEffectNode()
    var skyEffect: SKEffectNode = SKEffectNode()
    
    //UIs
    var titleLabel: SKLabelNode!
    var startButton: SKLabelNode!
    
    public override func didMove(to view: SKView) {
        self.backgroundColor = .black
        
        self.setupTracker()
        self.setupNodes()
        self.setupUI()
    }
    
    
    private func setupTracker() {
        let options = [NSTrackingArea.Options.mouseMoved, NSTrackingArea.Options.activeInKeyWindow, NSTrackingArea.Options.activeAlways, NSTrackingArea.Options.inVisibleRect, ] as NSTrackingArea.Options
        let tracker = NSTrackingArea(rect:frame, options: options, owner:view, userInfo: nil)
        view?.addTrackingArea(tracker)
    }
    
    @objc public static override var supportsSecureCoding: Bool {
        // SKNode conforms to NSSecureCoding, so any subclass going
        // through the decoding process must support secure coding
        get {
            return true
        }
    }
    
    func touchDown(atPoint pos : CGPoint) {
        if startButton.contains(pos) {
            self.handleButtonClicked()
        }
    }
    
    public override func mouseDown(with event: NSEvent) {
        touchDown(atPoint: event.location(in: self))
    }
    
    
    public override func update(_ currentTime: TimeInterval) {
        
    }
    
    public override func mouseMoved(with event: NSEvent) {
        let location = event.location(in: self)
        
        self.updateFilter(of: treeEffect, newValue: location.y.mapValue(from: 0...size.height, minResult: 0, maxResult: 5))
        
        if location.y > size.height / 2 {
            self.updateFilter(of: sceneryEffect, newValue: location.y.mapValue(from: size.height / 2...size.height, minResult: 0, maxResult: 5))
            self.updateFilter(of: skyEffect, newValue: location.y.mapValue(from: size.height / 2...size.height - 100, minResult: 3, maxResult: 0))
        } else {
            self.updateFilter(of: sceneryEffect, newValue: location.y.mapValue(from: 0...size.height / 2, minResult: 5, maxResult: 0))
            self.updateFilter(of: skyEffect, newValue: location.y.mapValue(from: 0...size.height / 2, minResult: 3, maxResult: 3))
        }
        self.checkMousePosition(mousePos: location)
    }
    
    func updateFilter(of effectNode: SKEffectNode, newValue val: CGFloat) {
        let updatedFilter = CIFilter(name:"CIGaussianBlur")
        updatedFilter!.setValue(val, forKey: "inputRadius")
        effectNode.filter = updatedFilter
    }
    
    func checkMousePosition(mousePos: CGPoint) {
        let fadeAction = SKAction.fadeAlpha(to: 0.5, duration: 0.3)
        fadeAction.timingMode = .easeOut
        
        let showAction = SKAction.fadeAlpha(to: 1, duration: 0.3)
        showAction.timingMode = .easeIn
        
        if startButton.frame.contains(mousePos) {
            startButton.run(showAction)
        } else {
            startButton.run(fadeAction)
        }
    }
}



