//
//  _1_LottoTests.swift
//  01_LottoTests
//
//  Created by 김나용 on 19/03/2019.
//  Copyright © 2019 Yoee Kim. All rights reserved.
//

import XCTest
@testable import _1_Lotto

class _1_LottoTests: XCTestCase {
    
    var lottoMachine: LottoMachine!
    
    override func setUp() {
        lottoMachine = LottoMachine()
    }

    override func tearDown() {
        
    }

    func testMakeLotto() {
        let count = 5
        let lottos = lottoMachine.makeLottos(count: 5)
    }

    func testPerformanceExample() {
        self.measure {
        }
    }
}
