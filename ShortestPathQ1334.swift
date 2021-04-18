//
//  ShortestPathQ1334.swift
//  Algorithms
//
//  Created by Uji Saori on 2021-04-18.
//

import Foundation
class Solution {
    func findTheCity(_ n: Int, _ edges: [[Int]], _ distanceThreshold: Int) -> Int {
        let inf = 10001
        var d = [[Int]](repeating: [Int](repeating: inf, count: n), count: n)
        for edge in edges {
            var u = edge[0]
            var v = edge[1]
            var w = edge[2]
            d[u][v] = w
            d[v][u] = w
        }
    
        for k in 0..<n {
            for i in 0..<n {
                for j in 0..<n {
                    d[i][j] = min(d[i][j], d[i][k] + d[k][j])
                }
            }
        }
        
        var neighbor = 0
        var min = (node: 0, neighbor: n)
        for i in 0..<n {
            neighbor = 0
            for j in 0..<n {
                if i == j { continue }
                if d[i][j] <= distanceThreshold {
                    neighbor += 1
                }
            }
            if neighbor <= min.neighbor {
                min = (node: i, neighbor: neighbor)
            }
        }
        return min.node
    }
}
