import AppKit
import SpriteKit
import GameplayKit

public class MainScene: SKScene {
    //Constants
    let scl = 10
    
    //SKNodes
    var particleNodes: [PainterParticle]!
    var perlinField: SKFieldNode!
    
    //Vectors
    var vecs: [[CGVector]]!
    
    //Checks
    var flag = false
    
    //Noises
    var noiseSource = GKBillowNoiseSource(frequency: 3, octaveCount: 3, persistence: 0.2, lacunarity: 1, seed: 10)
    
    //CustomPrefs
    public var prefs: PaintingPreference?
    
    convenience public init?(fileNamed: String, preference: PaintingPreference) {
        self.init(fileNamed: fileNamed)
        self.prefs = preference
    }
    
    public override func didMove(to view: SKView) {
        super.didMove(to: view)
        self.applyCustomNoise()
        self.backgroundColor = prefs?.bgColor ?? NSColor(displayP3Red: 0.08, green: 0.09, blue: 0.17, alpha: 1)
        
        self.generateNoiseStuff()
        self.generateNodes(amount: 700)
        self.showParticles()
    }
    
    private func applyCustomNoise() {
        guard let customPref = self.prefs else {return}
        let freq = customPref.freq ?? 3
        let oct = customPref.octave ?? 3
        let perst = customPref.persistance ?? 0.2
        let lac = customPref.lacunarity ?? 1
        let seed = customPref.seed ?? 10
        self.noiseSource = GKBillowNoiseSource(frequency: freq, octaveCount: oct, persistence: perst, lacunarity: lac, seed: seed)
    }
    
    func createBGFromVec() {
        guard vecs != nil else {return}
        for y in 0 ... vecs.count - 1 {
            for x in 0 ... vecs[y].count - 1{
                let colorVal = vecs[y][x].angle.mapValue(from: -.pi ... .pi, minResult: 0, maxResult: 1)
                let color = NSColor(white: colorVal, alpha: 1)
                let nodeBGTest = SKSpriteNode(color: color, size: CGSize(width: scl, height: scl))
                nodeBGTest.position = CGPoint(x: y * scl, y: x * scl)
                self.addChild(nodeBGTest)
            }
        }
    }
    
    private func generateNodes(amount: Int) {
        self.particleNodes = [PainterParticle]()
        for _ in 0 ... amount {
            let particle = PainterParticle(particleRadius: 10)
            particle.zPosition = 1
            //Emitter
            let emitter = SKEmitterNode(fileNamed: "Paint")
            emitter?.particleColorSequence = nil
            emitter?.particleColor = prefs?.colors?.randomElement() ?? PresetColors.c1.randomElement()!
            emitter?.particleScale = (prefs?.particleSize ?? 0.1).mapValue(from: 0.1...100, minResult: 0.1, maxResult: 0.3)
            emitter?.particleScaleSpeed = prefs?.sizeChange?.mapValue(from: 0...100, minResult: 0, maxResult: 0.3) ?? 0
            emitter?.particleLifetime = prefs?.length?.mapValue(from: 1...100, minResult: 0.1, maxResult: 1.2) ?? 0.3
            emitter?.name = "emitta"
            
            emitter?.targetNode = self
            particle.addChild(emitter!)
            particleNodes.append(particle)
        }
    }
    
    @objc public static override var supportsSecureCoding: Bool {
        // SKNode conforms to NSSecureCoding, so any subclass going
        // through the decoding process must support secure coding
        get {
            return true
        }
    }
    
    func showParticles() {
        particleNodes.forEach { (particle) in
            let randomX = CGFloat.random(in: 0 ... size.width)
            let randomY = CGFloat.random(in: 0 ... size.height)
            particle.position = CGPoint(x: randomX, y: randomY)
            particle.physicsBody?.mass = 1
            
            self.addChild(particle)
        }
        flag = true
    }
    
    func touchDown(atPoint pos : CGPoint) {
        if flag {
            return
        }
        self.showParticles()
        flag = true
    }
    
    
    public override func mouseDown(with event: NSEvent) {
        touchDown(atPoint: event.location(in: self))
    }
    
    public override func update(_ currentTime: TimeInterval) {
        if flag {
            self.moveParticles()
        }
    }
    
    private func generateNoiseStuff() {
        vecs = [[CGVector]]()
        
        let noise = GKNoise(noiseSource)
        
        let noiseMap = GKNoiseMap(noise, size: double2(0.5,0.5), origin: double2(10,10), sampleCount: int2(Int32(size.width),Int32(size.height)), seamless: true)
        
        for y in stride(from: 0, to: Int(size.width), by: scl) {
            var rows = [CGVector]()
            for x in stride(from: 0, to: Int(size.height), by: scl) {
                let _x = Int32(x / scl)
                let _y = Int32(y / scl)
                let val = CGFloat(noiseMap.value(at: vector_int2(_x, _y)))

                let angle = val.mapValue(from: -1...1, minResult: 0, maxResult: 360).toRadian()
                var noisedVector = CGVector(angle: angle)
                noisedVector *= 100
                rows.append(noisedVector)
            }
            vecs.append(rows)
        }
    }
    
    func getVec(from pos: CGPoint) -> CGVector  {
        let row = abs(Int(pos.x) / scl)
        let col = abs(Int(pos.y) / scl)
        return vecs[row][col]
    }
    
    private func moveParticles() {
        particleNodes.forEach { (particleNode) in
            particleNode.checkEdges(size: self.size)
            let noiseVec = getVec(from: particleNode.position)
            let velOffset = CGFloat.random(in: 0.5...1.3)
            particleNode.physicsBody?.velocity = noiseVec * velOffset
        }
    }
}
