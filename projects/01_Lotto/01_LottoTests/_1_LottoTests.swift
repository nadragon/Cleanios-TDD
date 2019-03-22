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

    func testLottoCount() {
        let count = 5
        let lottos = lottoMachine.makeLottos(count: count)
        XCTAssertEqual(count, lottos.count)
    }
    
    func testRandomLotto() {
        let count = 2
        let lottos = lottoMachine.makeLottos(count: count)
        XCTAssertNotEqual(lottos[0], lottos[1])
    }

    func testPerformanceExample() {
        self.measure {
        }
    }
}
