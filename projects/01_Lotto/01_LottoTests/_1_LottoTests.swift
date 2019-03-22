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
    
    func testCalculateLottoCount() {
        let payment = 5000
        let expectedCount = 5
        
        let lottoCount = lottoMachine.countOfLottos(payment: payment)
        XCTAssertEqual(lottoCount, expectedCount)
    }
    
    func testRandomLottoCount() {
        let count = 5
        let lottos = lottoMachine.makeLottos(count: count)
        XCTAssertEqual(count, lottos.count)
    }
    
    func testLottoIsRandom() {
        let count = 2
        let lottos = lottoMachine.makeLottos(count: 2)
        XCTAssertNotEqual(lottos[0], lottos[1])
    }
    
    func testPrizeRanking() {
        let myLotto = [1, 8, 11, 31, 41, 42]
        let winningNumebers = [1, 5, 11, 19, 25, 31]
        let bonusNumber = 7
        let expectedRanking = 3
        
        let prizeRanking = lottoMachine.prizeRanking(of: myLotto, winningNumbers: winningNumebers, bonus: bonusNumber)
        
        XCTAssertEqual(expectedRanking, prizeRanking)
    }

    func testPerformanceExample() {
        self.measure {
        }
    }
}
