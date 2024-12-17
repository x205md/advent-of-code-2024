import Foundation
import RegexBuilder

let input = try String(contentsOfFile: "./input.txt", encoding: .utf8)

let regex = /mul\(([0-9]+),([0-9]+)\)/
let mul = input.matches(of: regex).map { match in
    let x = Int(match.1) ?? 1
    let y = Int(match.2) ?? 1
    return x * y
}
let sum = mul.reduce(0, { x, y in x + y })
print("Sum 1: \(sum)")

let regex2 = /mul\(([0-9]+),([0-9]+)\)|(do\(\))|(don\'t\(\))/
let mul2 = input.matches(of: regex2)
var acc = 0
var doable = true
for match in mul2 {
    if match.4 == "don't()" {
        doable = false
    } else if match.3 == "do()" {
        doable = true
    } else {
        if doable {
            let x = Int(match.1 ?? "") ?? 1
            let y = Int(match.2 ?? "") ?? 1
            acc += x * y
        }
    }
}
print("Sum 2: \(acc)")
