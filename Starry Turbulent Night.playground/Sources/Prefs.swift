import SpriteKit
import GameplayKit

public struct PaintingPreference {
    public init() {
        
    }
    public var colors: [NSColor]?
    public var bgColor: NSColor?
    
    //Emitter Setups
    public var particleSize: CGFloat?
    public var sizeChange: CGFloat?
    public var length: CGFloat?
    
    //Noise Setups
    public var freq: Double?
    public var octave: Int?
    public var persistance: Double?
    public var lacunarity: Double?
    public var seed: Int32?
}

