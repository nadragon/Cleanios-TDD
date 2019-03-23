//
//  main.swift
//  LottoProgram
//
//  Created by 김나용 on 23/03/2019.
//  Copyright © 2019 Yoee Kim. All rights reserved.
//

import Foundation

func exitWithError() -> Never {
    print("ERROR : Wrong input")
    exit(0)
}

print("구매 금액을 입력해주세요.")
guard let payment = Int(readLine()!) else {
    exitWithError()
}
print()

let lottoMachine = LottoMachine()
let count = lottoMachine.countOfLottos(payment: payment)
print("\(count)개를 구매했습니다.")

let lottos = lottoMachine.makeLottos(count: count)
lottos.forEach { print($0) }
print()

print("지난 주 당첨 번호를 입력해 주세요. 예시) 1, 2, 3, 4, 5, 6")
let winningNumbersInput = readLine()?
    .replacingOccurrences(of: " ", with: "")
    .split(separator: ",")
    .compactMap { Int($0) }
guard let winningNumbers = winningNumbersInput,
    winningNumbers.count == 6 else {
        exitWithError()
}
print()

print("보너스 볼을 입력해주세요.")
guard let bonus = Int(readLine()!) else {
    exitWithError()
}
print()

print("당첨 통계")
print("----------")

let prizes = lottos.compactMap { lotto in
    lottoMachine.prizeRanking(of: lotto, winningNumbers: winningNumbers, bonus: bonus)
}

print("3개 일치 (5000원)- \(prizes.filter { $0 == 5 }.count)개")
print("4개 일치 (50000원)- \(prizes.filter { $0 == 4 }.count)개")
print("5개 일치 (1500000원)- \(prizes.filter { $0 == 3 }.count)개")
print("5개 일치, 보너스 볼 일치 (30000000원)- \(prizes.filter { $0 == 2 }.count)개")
print("6개 일치 (2000000000원)- \(prizes.filter { $0 == 1 }.count)개")
print("총 수익률은 % 입니다.")
