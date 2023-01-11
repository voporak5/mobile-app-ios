//: [Previous](@previous)

// Tests should perform binary search on sorted integer array and return
// index of the key or -1 if not found

import Foundation


func rank(key: Int, set: [Int]) -> Int {
    return rankHelper(key: key, set: set, left: 0, right: set.count - 1)
}

func rankHelper(key: Int, set: [Int], left: Int, right: Int) -> Int {
    if(left > right) { return -1; }

    var mid = (left + right) / 2;
    if(key == set[mid]) { return mid; }
    
    if(key > set[mid]) { return rankHelper(key: key, set: set, left: mid + 1, right: right)}
    else { return rankHelper(key: key, set: set, left: left, right: right - 1)}
}

var set = [-1,0,1,3,6,7,10,101,3034,12423]
print("Running Rank Tests On Set: \(set)")

//Pass Tests
print("\nRunning Pass Tests")
print("Index of -1 \(rank(key: -1,set: set))")
print("Index of 0 \(rank(key: 0,set: set))")
print("Index of 1 \(rank(key: 1,set: set))")
print("Index of 101 \(rank(key: 101,set: set))")
print("Index of 12423 \(rank(key: 12423,set: set))")

//Fail Tests
print("\nRunning Fail Tests")
print("Index of -1000 \(rank(key: -1000,set: set))")
print("Index of 8 \(rank(key: 8,set: set))")
print("Index of 12424 \(rank(key: 12424,set: set))")


//: [Next](@next)
