//
//  LottoTest.swift
//  LottoTest
//
//  Created by 김나용 on 23/03/2019.
//  Copyright © 2019 Yoee Kim. All rights reserved.
//

import XCTest
@testable import LottoProgram

class LottoTest: XCTestCase {
    
    var lottoMachine: LottoMachine!
    
    override func setUp() {
        lottoMachine = LottoMachine()
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
        let lottos = lottoMachine.makeLottos(count: count)
        XCTAssertNotEqual(lottos[0], lottos[1])
    }
    
    func testPrizeRanking_1() {
        let myLotto = [1, 8, 11, 31, 41, 42]
        lottoMachine.winningNumbers = [1, 5, 11, 19, 25, 31]
        lottoMachine.bonusNumber = 7
        let expectedRanking = 5
        
        let prizeRanking = lottoMachine.ranking(of: myLotto)
        
        XCTAssertEqual(expectedRanking, prizeRanking)
    }
    
    func testPrizeRanking_2() {
        let myLotto = [1, 8, 11, 31, 41, 7]
        lottoMachine.winningNumbers = [1, 8, 11, 31, 41, 45]
        lottoMachine.bonusNumber = 7
        let expectedRanking = 2
        
        let prizeRanking = lottoMachine.ranking(of: myLotto)
        
        XCTAssertEqual(expectedRanking, prizeRanking)
    }
    
    func testPerformanceExample() {
        self.measure {
        }
    }
}
