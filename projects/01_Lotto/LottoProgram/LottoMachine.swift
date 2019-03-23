//
//  LottoMachine.swift
//  LottoProgram
//
//  Created by 김나용 on 23/03/2019.
//  Copyright © 2019 Yoee Kim. All rights reserved.
//

import Foundation

typealias Lotto = [Int]

class LottoMachine {
    
    let lottoPrice = 1000
    
    func countOfLottos(payment: Int) -> Int {
        return payment / lottoPrice
    }
    
    func makeLottos(count: Int) -> [Lotto] {
        var lotto: [Int] {
            return (0..<6).map() { _ in
                Int.random(in: 1...45)
            }
        }
        return (0..<count).map() { _ in lotto }
    }
    
    func prizeRanking(of lotto: Lotto, winningNumbers: Lotto, bonus: Int) -> Int {
        let lottoNums = Set(lotto)
        let winningNums = Set(winningNumbers)
        let sameNumberCount = lottoNums.intersection(winningNums).count
        
        let rankingsBySameNumberCount = [
            3 : 5,
            4 : 4,
            5 : lottoNums.contains(bonus) ? 2 : 3,
            6 : 1
        ]
        return rankingsBySameNumberCount[sameNumberCount] ?? -1
    }
    
}
