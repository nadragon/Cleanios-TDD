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
    let prizesByRanking = [
        1 : 2000000000,
        2 : 30000000,
        3 : 1500000,
        4 : 50000,
        5 : 5000
    ]
    
    var winningNumbers: Lotto?
    var bonusNumber: Int?
    
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
    
    func ranking(of lotto: Lotto) -> Int? {
        let rankings = [
            3 : 5,
            4 : 4,
            5 : lotto.contains(bonusNumber ?? -1) ? 2 : 3,
            6 : 1
        ]
        return rankings[sameNumberCount(of: lotto)]
    }
    
    private func sameNumberCount(of lotto: Lotto) -> Int {
        let lottoNums = Set(lotto)
        let winningNums = Set(winningNumbers ?? [])
        return lottoNums.intersection(winningNums).count
    }
}
