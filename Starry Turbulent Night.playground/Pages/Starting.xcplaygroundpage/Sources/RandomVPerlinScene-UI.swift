import AppKit
import SpriteKit
import GameplayKit

extension RandomVNoiseScene {
    func setupUI() {
        self.setupRandomButton()
        self.setupNoiseButton()
    }
    
    private func setupNoiseButton() {
        noiseButton = SKLabelNode()
        noiseButton.text = "Noise"
        noiseButton.fontName = "Helvetica Neue Light"
        noiseButton.fontSize = 35
        noiseButton.position = CGPoint(x: 15, y: size.height / 2 + 50)
        noiseButton.fontColor = NSColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        noiseButton.alpha = 1
        noiseButton.blendMode = .multiply
        noiseButton.verticalAlignmentMode = .bottom
        noiseButton.horizontalAlignmentMode = .left
        noiseButton.name = "Button"
        
        let sz = CGSize(width: randomButton.frame.width + 20, height: noiseButton.frame.height + 10)
        noiseButtonBG = SKSpriteNode(texture: nil, color: NSColor(white: 0.8, alpha: 1), size: sz)
        noiseButtonBG.alpha = 1
        noiseButtonBG.position = CGPoint(x: 0, y: noiseButton.frame.minY - 5)
        noiseButtonBG.anchorPoint = CGPoint(x: 0, y: 0)
        noiseButtonBG.name = "Button"
        self.addChild(noiseButtonBG)
        
        self.addChild(noiseButton)
    }
    
    private func setupRandomButton() {
        randomButton = SKLabelNode()
        randomButton.text = "Random"
        randomButton.fontName = "Helvetica Neue Light"
        randomButton.fontSize = 35
        randomButton.position = CGPoint(x: 15, y: size.height / 2)
        randomButton.fontColor = NSColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        randomButton.alpha = 1
        randomButton.blendMode = .multiply
        randomButton.verticalAlignmentMode = .bottom
        randomButton.horizontalAlignmentMode = .left
        randomButton.name = "Button"
        
        let sz = CGSize(width: randomButton.frame.width + 20, height: randomButton.frame.height + 10)
        randomButtonBG = SKSpriteNode(texture: nil, color: NSColor(white: 0.8, alpha: 1), size: sz)
        randomButtonBG.alpha = 1
        randomButtonBG.position = CGPoint(x: 0, y: randomButton.frame.minY - 5)
        randomButtonBG.anchorPoint = CGPoint(x: 0, y: 0)
        randomButtonBG.name = "Button"
        self.addChild(randomButtonBG)
        
        self.addChild(randomButton)
    }
}
