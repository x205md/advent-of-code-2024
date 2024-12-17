
import Foundation

func xmas(x: Int, y: Int, lines: [[Substring.SubSequence]]) -> Int {
    if lines[x][y] != "X" {
        return 0
    }

    var nXmas = 0

    if y + 3 < lines[x].count
        && lines[x][y + 1] == "M"
        && lines[x][y + 2] == "A"
        && lines[x][y + 3] == "S"
    {
        nXmas += 1
    }
    if y > 2
        && lines[x][y - 1] == "M"
        && lines[x][y - 2] == "A"
        && lines[x][y - 3] == "S"
    {
        nXmas += 1
    }
    if x + 3 < lines.count
        && lines[x + 1][y] == "M"
        && lines[x + 2][y] == "A"
        && lines[x + 3][y] == "S"
    {
        nXmas += 1
    }
    if x > 2
        && lines[x - 1][y] == "M"
        && lines[x - 2][y] == "A"
        && lines[x - 3][y] == "S"
    {
        nXmas += 1
    }
    if x > 2 && y > 2
        && lines[x - 1][y - 1] == "M"
        && lines[x - 2][y - 2] == "A"
        && lines[x - 3][y - 3] == "S"
    {
        nXmas += 1
    }
    if x > 2 && y + 3 < lines[x].count
        && lines[x - 1][y + 1] == "M"
        && lines[x - 2][y + 2] == "A"
        && lines[x - 3][y + 3] == "S"
    {
        nXmas += 1
    }
    if x + 3 < lines.count && y + 3 < lines[x].count
        && lines[x + 1][y + 1] == "M"
        && lines[x + 2][y + 2] == "A"
        && lines[x + 3][y + 3] == "S"
    {
        nXmas += 1
    }
    if x + 3 < lines.count && y > 2
        && lines[x + 1][y - 1] == "M"
        && lines[x + 2][y - 2] == "A"
        && lines[x + 3][y - 3] == "S"
    {
        nXmas += 1
    }

    return nXmas
}

func masx(x: Int, y: Int, lines: [[Substring.SubSequence]]) -> Int {
    if lines[x][y] != "A" {
        return 0
    }

    if (x < 1 || x + 1 > lines.count - 1)
        || (y < 1 || y + 1 > lines[x].count - 1)
    {
        return 0
    }

    if lines[x - 1][y - 1] == "M"
        && lines[x + 1][y + 1] == "S"
        && lines[x - 1][y + 1] == "M"
        && lines[x + 1][y - 1] == "S"
    {
        return 1
    }
    if lines[x - 1][y - 1] == "S"
        && lines[x + 1][y + 1] == "M"
        && lines[x - 1][y + 1] == "S"
        && lines[x + 1][y - 1] == "M"
    {
        return 1
    }
    if lines[x - 1][y - 1] == "S"
        && lines[x + 1][y + 1] == "M"
        && lines[x - 1][y + 1] == "M"
        && lines[x + 1][y - 1] == "S"
    {
        return 1
    }
    if lines[x - 1][y - 1] == "M"
        && lines[x + 1][y + 1] == "S"
        && lines[x - 1][y + 1] == "S"
        && lines[x + 1][y - 1] == "M"
    {
        return 1
    }
    return 0
}

let filename = "./input.txt"
let input = try String(contentsOfFile: filename, encoding: .utf8)
let lines = input.split(separator: "\n")
    .map({ line in line.split(separator: "") })

var nXmas = 0
var nMasx = 0
for (x, line) in lines.enumerated() {
    for (y, _) in line.enumerated() {
        nXmas += xmas(x: x, y: y, lines: lines)
        nMasx += masx(x: x, y: y, lines: lines)
    }
}

print("XMAS: \(nXmas), X-MAS: \(nMasx)")
