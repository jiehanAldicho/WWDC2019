import SpriteKit

public class PainterParticle: SKSpriteNode {
    
    public convenience init(particleRadius: CGFloat) {
        self.init(texture: nil, color: .clear, size: CGSize(width: particleRadius, height: particleRadius))
        self.setupPhysicsBody()
    }
    
    public override init(texture: SKTexture?, color: NSColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
//        self.bulge()
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupPhysicsBody() {
        self.physicsBody = SKPhysicsBody(circleOfRadius: self.frame.width)
        self.physicsBody?.collisionBitMask = 0
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.friction = 0
        self.physicsBody?.restitution = 0
        self.physicsBody?.allowsRotation = true
        self.physicsBody?.isDynamic = true
    }
    
    public func checkEdges(size: CGSize) {
        if  self.position.x >= size.width ||
            self.position.x <= 0 ||
            self.position.y >= size.height ||
            self.position.y <= 0
        {
            //            self.removeFromParent()
            self.showAtRandom(area: size)
        }
    }
    
    public func wrapAround(size: CGSize) {
        let safeDistance: CGFloat = 1
        if self.position.x >= size.width - safeDistance{
            self.position.x = safeDistance
        } else if self.position.x <= safeDistance {
            self.position.x = size.width - safeDistance
        } else if self.position.y >= size.height - safeDistance {
            self.position.y = safeDistance
        } else if self.position.y <= safeDistance {
            self.position.y = size.height - safeDistance
        }
    }
    
    func showAtRandom(area: CGSize) {
        self.position.x = CGFloat.random(in: 1...area.width - 1)
        self.position.y = CGFloat.random(in: 1...area.height - 1)
    }
    
    func bulge() {
        //Duration will deterimine how long particle stays on screen
        //We may use fade out instead of smallen as well
        
        let biggen = SKAction.resize(toWidth: 5, height: 5, duration: 1)
        biggen.timingMode = .easeIn
        
        let smallen = SKAction.resize(toWidth: 0, height: 0, duration: 1)
        smallen.timingMode = .easeOut
        
        //        let
        let rand = TimeInterval.random(in: 0.8...1.5)
        let sequence = SKAction.sequence([
            .fadeOut(withDuration: rand),
            .fadeIn(withDuration: rand)
            ])
        
        let forever = SKAction.repeatForever(sequence)
        
        self.run(forever)
    }
}
