//
//  ShortestPathQ743.swift
//  Algorithms
//
//  Created by Uji Saori on 2021-04-18.
//

import Foundation

class Solution {
    func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
        let inf = 6001
        var dist = [Int](repeating: inf, count: n + 1)
        dist[k] = 0         // strat node
       
        for i in 1..<n {
            for edge in times {
                if dist[edge[0]] != inf && dist[edge[1]] > dist[edge[0]] + edge[2] {
                    dist[edge[1]] = dist[edge[0]] + edge[2]
                }
            }
        }

        var maxTime = -1    // impossible
        for i in 1..<dist.count {
            if dist[i] == inf {
                return -1
            }
            if dist[i] == 0 { continue }
            maxTime = max(maxTime, dist[i])
        }
        return maxTime
    }
}
