import SpriteKit
import AppKit

extension StartScene {
    func setupUI() {
        self.setupStartButton()
        self.setupTitleLabel()
    }
    
    private func setupTitleLabel() {
        titleLabel = SKLabelNode()
        titleLabel.text = "Starry Turbulent Night"
        titleLabel.fontName = "Futura Medium"
        titleLabel.fontSize = 45
        titleLabel.position = CGPoint(x: size.width / 2 - 170, y: size.height / 2 + 200)
        titleLabel.fontColor = .white
        titleLabel.horizontalAlignmentMode = .left
        
        let sz = CGSize(width: size.width, height: startButton.frame.height + 20)
        let titleAccesory = SKSpriteNode(texture: nil, color: NSColor(white: 0.1, alpha: 1), size: sz)
        titleAccesory.alpha = 1
        titleAccesory.position = CGPoint(x: titleLabel.position.x - 10, y: titleLabel.position.y)
        titleAccesory.anchorPoint = CGPoint(x: 0, y: 0.25)
        self.addChild(titleAccesory)
        
        self.addChild(titleLabel)
    }
    
    private func setupStartButton() {
        startButton = SKLabelNode()
        startButton.text = "Start"
        startButton.fontName = "Helvetica Neue Thin"
        startButton.fontSize = 50
        startButton.position = CGPoint(x: size.width / 2 - 170, y: size.height / 2 + 120) //Remember to change x to -200
        startButton.fontColor = .white
        startButton.alpha = 0.5 //Rember to rchange baclk to 0
        startButton.horizontalAlignmentMode = .left
        
        let startAccesory = SKShapeNode(rectOf: CGSize(width: 5, height: startButton.frame.height))
        startAccesory.fillColor = NSColor(white: 0.1, alpha: 1)
        startAccesory.alpha = 1
        startAccesory.strokeColor = .clear
        startAccesory.position = CGPoint(x: startButton.position.x - 10, y: startButton.position.y + startAccesory.frame.height / 2)
        self.addChild(startAccesory)
        
        self.addChild(startButton)
//        self.showStartButton()
    }
    
    func showStartButton() {
        //Initial Action
        let showAction = SKAction.move(to: CGPoint(x: size.width / 2 - 150, y: size.height / 2 + 100), duration: 0.7)
        showAction.timingMode = .easeIn
        let alphaAction = SKAction.fadeAlpha(to: 0.5, duration: 3.5)
        startButton.run(showAction)
        startButton.run(alphaAction)
        
        
    }
    
    @objc func handleButtonClicked() {
        //Navigate
        let transition = SKTransition.reveal(with: .left, duration: 1)
        let randomNoiseScene = RandomVNoiseScene()
        randomNoiseScene.size = self.size
        randomNoiseScene.position = self.position

        scene?.view?.presentScene(randomNoiseScene, transition: transition)
    }
}

