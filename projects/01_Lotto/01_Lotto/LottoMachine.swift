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
    
    
    func makeLottos(count: Int) -> [Lotto] {
        var lotto: [Int] {
            return (0..<6).map() { _ in
                Int.random(in: 1...45)
            }
        }
        return (0..<count).map() { _ in lotto }
    }
    
}
