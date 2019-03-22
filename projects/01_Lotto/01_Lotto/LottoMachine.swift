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
        let lotto = [1, 2, 3, 4, 5, 6]
        return [lotto, lotto, lotto, lotto, lotto]
    }
    
}
