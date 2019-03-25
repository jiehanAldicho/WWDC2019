import AppKit
import SpriteKit
import GameplayKit

public class RandomVNoiseScene: SKScene {
    //Constants
    let scl = 10
    enum BackgroundState {
        case Noise
        case Random
        case None
    }
    
    //Checks
    var flag = false
    var chosenBG: BackgroundState = .None
    
    //Noises
    var noiseSource = GKBillowNoiseSource(frequency: 3, octaveCount: 3, persistence: 0.2, lacunarity: 1, seed: 10)
    
    //UIs
    var randomButton: SKLabelNode!
    var noiseButton: SKLabelNode!
    var randomButtonBG: SKSpriteNode!
    var noiseButtonBG: SKSpriteNode!
    
    //Values
    var colorVals: [[CGVector]]!
    
    //Nodes
    var bgNodes: [[SKSpriteNode]]!
    
    public override func didMove(to view: SKView) {
        super.didMove(to: view)
        self.anchorPoint = CGPoint(x: 0, y: 0)
        
        self.backgroundColor = .lightGray
        self.setupUI()
    }
    
    @objc public static override var supportsSecureCoding: Bool {
        // SKNode conforms to NSSecureCoding, so any subclass going
        // through the decoding process must support secure coding
        get {
            return true
        }
    }
    
    private func generateNoiseVectors(withSeed seed: Int32) {
        noiseSource.seed = seed
        colorVals = [[CGVector]]()
        
        let noise = GKNoise(noiseSource)
        
        let noiseMap = GKNoiseMap(noise, size: double2(0.5,0.5), origin: double2(10,10), sampleCount: int2(Int32(size.width),Int32(size.height)), seamless: true)
        
        
        for y in stride(from: 0, to: Int(size.width), by: scl) {
            var rows = [CGVector]()
            for x in stride(from: 0, to: Int(size.height), by: scl) {
                let _x = Int32(x / scl)
                let _y = Int32(y / scl)
                let val = CGFloat(noiseMap.value(at: vector_int2(_x, _y)))
                
                let angle = val.mapValue(from: -1...1, minResult: 0, maxResult: 360).toRadian()
                //                let angle = CGFloat(val.map(from: -1...1, minResult: 0, maxResult: 360)).toRadian()
                var noisedVector = CGVector(angle: angle)
                noisedVector *= 100
                rows.append(noisedVector)
            }
            colorVals.append(rows)
        }
    }
    
    func generateGeneralBG() {
        bgNodes = [[SKSpriteNode]]()
        for y in stride(from: 0, to: Int(size.height), by: scl) {
            var rowNodes = [SKSpriteNode]()
            for x in stride(from: 0, to: Int(size.width), by: scl){
                let color = NSColor(white: 1, alpha: 1)
                let bwBackgroundTile = SKSpriteNode(color: color, size: CGSize(width: scl, height: scl))
                bwBackgroundTile.position = CGPoint(x: x, y: y)
                bwBackgroundTile.anchorPoint = CGPoint(x: 0, y: 0)
                bwBackgroundTile.zPosition = -1000
                rowNodes.append(bwBackgroundTile)
                self.addChild(bwBackgroundTile)
            }
            bgNodes.append(rowNodes)
        }
    }
    
    func generateNoiseBG() {
        guard chosenBG == .Noise else {return}
        
        self.children.forEach { (node) in
            if node.name != "Button" {
                node.removeFromParent()
            }
        }
        
        guard colorVals != nil else {return}
        for y in 0 ... colorVals.count - 1 {
            for x in 0 ... colorVals[y].count - 1{
                let colorVal = colorVals[y][x].angle.mapValue(from: -.pi ... .pi, minResult: 0, maxResult: 1)
                let color = NSColor(white: colorVal, alpha: 1)
                let bwBackgroundTile = SKSpriteNode(color: color, size: CGSize(width: scl, height: scl))
                bwBackgroundTile.position = CGPoint(x: y * scl, y: x * scl)
                bwBackgroundTile.zPosition = -1000
                self.addChild(bwBackgroundTile)
            }
        }
    }
    
    
    func generateRandomBG() {
        guard chosenBG == .Random else {return}
        
        self.children.forEach { (node) in
            if node.name != "Button" {
                node.removeFromParent()
            }
        }
        
        for y in stride(from: 0, to: Int(size.height), by: scl) {
            for x in stride(from: 0, to: Int(size.width), by: scl){
                let colorVal = CGFloat.random(in: 0...1)
                let color = NSColor(white: colorVal, alpha: 1)
                let bwBackgroundTile = SKSpriteNode(color: color, size: CGSize(width: scl, height: scl))
                bwBackgroundTile.position = CGPoint(x: x, y: y)
                bwBackgroundTile.anchorPoint = CGPoint(x: 0, y: 0)
                bwBackgroundTile.zPosition = -1000
                self.addChild(bwBackgroundTile)
            }
        }
    }
    
    func touchDown(atPoint pos : CGPoint) {
        if noiseButtonBG.contains(pos) {
            self.chosenBG = .Noise
            
            self.generateNoiseVectors(withSeed: Int32.random(in: 0...123))
            self.generateNoiseBG()
        }
        
        if randomButtonBG.contains(pos) {
            self.chosenBG = .Random
            self.generateRandomBG()
        }
    }
    
    public override func mouseDown(with event: NSEvent) {
        touchDown(atPoint: event.location(in: self))
    }
}
