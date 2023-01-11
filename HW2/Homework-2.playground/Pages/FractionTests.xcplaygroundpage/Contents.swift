//: [Previous](@previous)

import Foundation

var msg = "Running Fraction Operator Tests"
print(msg)

let fraction2_4 = Fraction(2,4)
let fraction1_2 = Fraction(1,2)
var result = fraction2_4 + fraction1_2;

//Should print out 1/1
print("\(fraction2_4) + \(fraction1_2) = \(result)")

result = fraction2_4 - fraction1_2;

//Should print out 0/1
print("\(fraction2_4) - \(fraction1_2) = \(result)")

result = fraction2_4 * fraction1_2;

//Should print out 1/4
print("\(fraction2_4) * \(fraction1_2) = \(result)")

result = fraction2_4 / fraction1_2;

//Should print out 1/1
print("\(fraction2_4) / \(fraction1_2) = \(result)")

msg = "\nRunning Fraction Operator and = Tests"
print(msg)

var fraction = Fraction(7,10);
var fractionCopy : Fraction = fraction.copy()
let fraction1_3 = Fraction(1,3);

//Should print out 31/30 because 1/3 of 10 rounded up is 4
fraction += fraction1_3
print("\(fractionCopy) + \(fraction1_3) = \(fraction)")

//Should print out 7/10
fractionCopy = fraction.copy()
fraction -= fraction1_3
print("\(fractionCopy) - \(fraction1_3) = \(fraction)")

//Should print out 7/30
fractionCopy = fraction.copy()
fraction *= fraction1_3
print("\(fractionCopy) * \(fraction1_3) = \(fraction)")

//Should print out 7/10
fractionCopy = fraction.copy()
fraction /= fraction1_3
print("\(fractionCopy) / \(fraction1_3) = \(fraction)")

//: [Next](@next)
