import Foundation
import AppKit

extension CGFloat {
    public func mapValue(from: ClosedRange<CGFloat>, minResult: CGFloat, maxResult: CGFloat) -> CGFloat {
        let result = ((self - from.lowerBound) / (from.upperBound - from.lowerBound)) * (maxResult - minResult) + minResult
        return result
    }
    
    public func toRadian() -> CGFloat {
        return (self * .pi) / 180
    }
}

extension Float {
    public func map(from: ClosedRange<CGFloat>, minResult: CGFloat, maxResult: CGFloat) -> Float {
        return Float(CGFloat(self).mapValue(from: from, minResult: minResult, maxResult: minResult))
    }
}
