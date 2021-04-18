//
//  ShortestPathQ787.swift
//  Algorithms
//
//  Created by Uji Saori on 2021-04-18.
//

import Foundation

class Solution {
    func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ K: Int) -> Int {
        var adj = [[(v: Int, w: Int)]](repeating: [(v: Int, w: Int)](), count: n)
        for flight in flights {
            adj[flight[0]].append((v: flight[1], w: flight[2]))
        }

        var q = [(v: Int, w: Int, k: Int)]()
        q.append((v: src, w: 0, k: 0))
        var minCost = Int.max
        while !q.isEmpty {
            let curFlight = q.removeFirst()
           
            if curFlight.v == dst {
                minCost = min(minCost, curFlight.w)
                continue
            }
            
            if curFlight.w > minCost || curFlight.k > K { continue }
            
            for nextFlight in adj[curFlight.v] ?? [] {
                q.append((v: nextFlight.v, w: curFlight.w + nextFlight.w, k: curFlight.k + 1))
            }
        }
        
        return minCost != Int.max ? minCost : -1
    }
}
