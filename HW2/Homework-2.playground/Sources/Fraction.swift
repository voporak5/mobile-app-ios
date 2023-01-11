import Foundation

public class Fraction: CustomStringConvertible {
    
    var n : Int
    var d : Int
    
    public init(){
        n = 0;
        d = 0;
    }
    
    public init(_ numerator: Int, _ denominator: Int){
        n = numerator;
        d = denominator;
    }
    
    public func copy(with zone: NSZone? = nil) -> Fraction {
        return Fraction(n,d)
    }
    
    func add(_ f: Fraction) -> Fraction {
        let result: Fraction = Fraction();
        result.n = n * f.d + d * f.n;
        result.d = d * f.d;
        result.reduce();
        return result;
    }
    
    func subtract(_ f: Fraction) -> Fraction {
        let result: Fraction = Fraction();
        result.n = n * f.d - d * f.n;
        result.d = d * f.d;
        result.reduce();
        return result;
    }
    
    func multiply(_ f: Fraction) -> Fraction{
        let result: Fraction = Fraction();
        result.n = n * f.n;
        result.d = d * f.d;
        result.reduce();
        return result;
    }
    
    func divide(_ f: Fraction) -> Fraction{
        let result: Fraction = Fraction();
        result.n = n * f.d;
        result.d = d * f.n;
        result.reduce();
        return result;
    }
    
    func reduce() {
        var u = abs(n);
        var v = d;
        var r: Int;
        while (v != 0) {
            r = u % v; u = v; v = r;
        }
        
        n /= u;
        d /= u;
    }
    
    public static func +(a: Fraction, b: Fraction) -> Fraction {
        return a.add(b);
    }
    
    public static func +=(left: inout Fraction, right: Fraction) {
        left = left + right;
    }
    
    public static func -(a: Fraction, b: Fraction) -> Fraction {
        return a.subtract(b);
    }
    
    public static func -=(left: inout Fraction, right: Fraction) {
        left = left - right;
    }
    
    public static func *(a: Fraction, b: Fraction) -> Fraction {
        return a.multiply(b);
    }
    
    public static func *=(left: inout Fraction, right: Fraction) {
        left = left * right;
    }
    
    public static func /(a: Fraction, b: Fraction) -> Fraction {
        return a.divide(b);
    }
    
    public static func /=(left: inout Fraction, right: Fraction) {
        left = left / right;
    }
    
    public var description: String { return "\(n)/\(d)"; }
    
}
