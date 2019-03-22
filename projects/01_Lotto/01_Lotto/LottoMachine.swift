//
//  LottoMachine.swift
//  01_Lotto
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
        
        return {
            switch winningNums.intersection(lottoNums).count {
            case 3:
                return 5
            case 4:
                return 4
            case 5:
                return lottoNums.contains(bonus) ? 2 : 3
            case 6:
                return 1
            default:
                return -1
            }
            }()
    }
    
}
