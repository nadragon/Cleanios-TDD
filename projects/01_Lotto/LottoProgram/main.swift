//
//  main.swift
//  LottoProgram
//
//  Created by 김나용 on 23/03/2019.
//  Copyright © 2019 Yoee Kim. All rights reserved.
//

import Foundation

let lottoMachine = LottoMachine()

func exitWithError() -> Never {
    print("ERROR : Wrong input")
    exit(0)
}

func makeLottos() -> [Lotto] {
    print("구매 금액을 입력해주세요.")
    guard let payment = Int(readLine()!) else {
        exitWithError()
    }
    print()
    
    let count = lottoMachine.countOfLottos(payment: payment)
    print("\(count)개를 구매했습니다.")
    
    let lottos = lottoMachine.makeLottos(count: count)
    lottos.forEach { print($0) }
    print()
    
    return lottos
}

func setWinningNumbers() {
    print("지난 주 당첨 번호를 입력해 주세요. 예시) 1, 2, 3, 4, 5, 6")
    let winningNumbersInput = readLine()?
        .replacingOccurrences(of: " ", with: "")
        .split(separator: ",")
        .compactMap { Int($0) }
    guard let winningNumbers = winningNumbersInput,
        winningNumbers.count == 6 else {
            exitWithError()
    }
    lottoMachine.winningNumbers = winningNumbers
    print()
    
    print("보너스 볼을 입력해주세요.")
    guard let bonus = Int(readLine()!) else {
        exitWithError()
    }
    lottoMachine.bonusNumber = bonus
    print()
}

func showStatistic(of lottos: [Lotto]) {
    print("당첨 통계")
    print("----------")
    
    var rankingCounts = lottos
        .compactMap { lottoMachine.ranking(of: $0) }
        .reduce(into: [:]) { $0[$1, default: 0] += 1 }
    
    print("3개 일치 (5000원)- \(rankingCounts[5] ?? 0)개")
    print("4개 일치 (50000원)- \(rankingCounts[4] ?? 0)개")
    print("5개 일치 (1500000원)- \(rankingCounts[3] ?? 0)개")
    print("5개 일치, 보너스 볼 일치 (30000000원)- \(rankingCounts[2] ?? 0)개")
    print("6개 일치 (2000000000원)- \(rankingCounts[1] ?? 0)개")
    
    var profitRate: Int {
        let totalPrize = rankingCounts.compactMap {
            $0.value * (lottoMachine.prizesByRanking[$0.key, default: 0])
            }.reduce(0, +)
        let payment = lottos.count * lottoMachine.lottoPrice
        return totalPrize / payment * 100
    }
    print("총 수익률은 \(profitRate)% 입니다.")
}

let mylottos = makeLottos()
setWinningNumbers()
showStatistic(of: mylottos)
