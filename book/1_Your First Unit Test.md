# 1. Your First Unit Test

Prefix에서 말했 듯, 복잡해져가는 iOS 앱에서 Test의 중요성이 생겨나고 있습니다. 

이 책에서는 코드 작성 이전에, test를 작성하도록 하는 Test Driven Develpment(TDD)에 관하여 토론 해볼 것입니다. 또한, TDD의 장점과 단점도 살펴볼 것입니다.

이번 챕터의 목표는 아래와 같습니다.

- Building your first automatic unit test 
- Understanding TDD 
- TDD in Xcode 
- Advantages of TDD 
- Disadvantages of TDD 



---------------

## Building your first automatic unit test

먼저, 예시를 통해서 Unit Test의 필요성을 알아봅시다. 만약, text input을 받아 이 text가 알맞은 email 형식인지, 아닌지를 분간해야하는 프로그램을 짠다고 생각해봅시다. 이 때, 우리는 기능을 구현하고, 시뮬레이터를 구동하여, 알맞은 뷰를 띄우고, 다양한 input들을 넣어보면서 우리의 코드를 점검할 것입니다. 하지만, 이건 꽤나 오래 걸리는 귀찮은 작업입니다. 이를 위해서, test가 필요합니다.

### Whar are unit tests?

만약, 이를 로봇이 대신 해준다면 어떨까요. 그들이 시뮬레이터에서 알맞은 뷰를 띄우며 코드를 실행하는 과정 없이 이를 테스트할 수 있게 해준다면? 우리는 불필요하고 귀찮고 반복적인 작업을 하지 않아도 되겠죠! 이게 바로 Unit Test가 하는 일입니다.

### Implementing a unit text example

프로젝트 생성부터 해 봅시다. 이 과정에서 'include Unit Test'를 체크하면, test를 할 수 있는 베이스 클래스가 자동으로 생성됩니다.

``` Swift
import XCTest
@testable import _1_Lotto
```

Test를 담당하는 클래스는 `XCTest` framework를 가지고 있습니다. 얘는 우리의 테스트 클래스가 상속 받게 될 `XCTestCase`가 있는 곳이고, test에 필요한 assertion 기능도 가지고 있습니다.

`@testable`은 뭘까요. 이 친구는 class, struct, enum, function 등이 internal하기 때문에(같은 모듈 내에서만 접근 가능) 필요합니다. 얘를 통해서 우리의 테스트 클래스는 원하는 모듈에 접근할 수 있습니다.

```Swift
override func setUp() {
	// Put setup code here. This method is called before the invocation of each test method in the class.
}

override func tearDown() {
	// Put teardown code here. This method is called after the invocation of each test method in the class.
}
```

그라고, 테스트 케이스의 invocation 이전에 호출되는 `setup()`함수와 `tearDown()`함수를 만나보실 수 있습니다.

```Swift
func testExample() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

func testPerformanceExample() {
    // This is an example of a performance test case.
    self.measure {
        // Put the code you want to measure the time of here.
    }
}
```

`testExample` 는 일반적인 테스트 함수의 예시입니다.

`testPerformanceExample` 은 시간이 중요시되는 연산을 테스트하기 위한 함수입니다. `measure` 블럭이 여러번 불리면서, 그들의 평균값을 계산해낼 수 있습니다. 복잡한 알고리즘을 짤 때, 성능이 떨어지지는 않았는 지 체크하기 딱 좋은 아이지요. 

모든 테스트 함수들은 prefix로 `test` 를 붙여야 합니다! 그렇지 않으면, test case는 찾아지지 않고, 그에 따라 실행도 되지 않습니다.

이제, 테스트 케이스 예시를 살펴보지요! String에 몇개의 모음이 들어 있는지 세는 함수를 테스트해봅시다.

```Swift
class ViewController: UIViewController {
    func numberOfVowelsInString(_ string: String) -> Int {
        let vowels: [Character] = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
        return string.characters.reduce(0) { $0 + (vowels.contains($1) ? 1
            : 0) }
    }
}
```

```Swift
class _1_LottoTests: XCTestCase {
	func testNumberOfVowelsInString_ShouldReturnNumberOfVowels() {
 	   let viewController = ViewController()
 	   let string = "Dominik"
  	   let numberOfVowels = viewController.numberOfVowelsInString(string)
  	   XCTAssertEqual(numberOfVowels, 3, "should find 3 vowels in Dominik")
	}
}
```

간단하죠? test run (command+U)를 하시면, 테스트한 함수의 왼쪽에 초록 다이아몬드가 뜨고, 이를 통하여 정상 동작했음을 확인할 수 있습니다. 

다음으로 넘어가기에 앞서, 방금 배웠던 것들을 통하여 우리가 무엇을 배웠는 지 살펴볼까요? 첫째, 우리는 손쉽게 우리의 테스트 코드를 작성할 수 있는 방법에 관하여 배웠습니다. 둘째, 개발자들에게 '이 코드는 정상동작한다!'는 확신을 주어, 테스트는 우리의 코드 질을 향상 시킬 수 있습니다.

### Important built-in assert functions

- XCTAssertTrue
- XCTAssertFalse
- XCTAssertEqual
- XCTAssertEqualWithAccuracy
- XCTAssertNotEqual
- XCTAssertNil
- XCTAssertNotNil
- XCTFail



--------------

## Understanding TDD

1996년, Kent Back은 Extreme Programming이라는 이전과는 온전히 다른 새로운 프로그래밍 방법론을 제시했습니다. 이 방법론은 12가지의 습관과 practices를 기본으로 하고 있습니다.

> One of the rules states that developers have to write unit tests, and all parts of the software have to be thoroughly tested.

위와 같은 규칙도 있습니다. 모든 test는 production code 이전에 쓰여져야 합니다.

이런 Test-First Programming은 Test-Driven Development(TDD)를 이끌어낸다고 합니다. 이 말은 개발자들은 그들의 테스트가 실패하기 때문에만 코드를 작성해야 한다는 것을 의미합니다. 테스트들은 코드가 쓰여져야 하는 지, 아닌지를 나타낼 수 있습니다. 또한, 기능이 구현될 때, 측정(measure)도 제공합니다.

Robert C. Martin (known as Uncle Bob)은 TDD에 관한 보다 쉬운 3가지 규칙을 제안했습니다,

> 원글
>
> - You are not allowed to write any production code unless it is to pass a failing unit test 
> - You are not allowed to write any more of a unit test than is sufficient to fail; and compilation failures are failures 
> - You are not allowed to write any more production code than is sufficient to pass the one failing unit test 
>
> 한국어 버전
>
> - 실패하는 단위 테스트를 작성할 때까지 실제 코드를 작성하지 않는다
>
> - 컴파일은 실패하지 않으면서 실행이 실패하는 정도로만 단위테스트를 작성한다
>
> - 현재 실패하는 테스트를 통과할 정도로만 실제 코드를 작성한다
>
> [번역 참고](https://profecessorleejaeman.tistory.com/entry/TDD-법칙-세가지)

위와 같은 규칙을 통한다면, 우리는 기능 구현에 필요한 코드만을 작성 시킬 수 있을 것입니다. 또한, 필요한 테스트 코드만을 작성하게 될 것입니다. 더불어 이런 하나의 기능에만 집중하는 방식 덕분은 일을 조각 조각 나누어 수행하는 것을 가능하게 합니다. 덕분에, 누군가 "무슨 일 하고 있어요?"라고 물으면 빠르게 말할 수 있을 것입니다.

### The TDD workflow – red, green, and refactor









-----------

## 참고

- Test Driven iOS Development with Swift by.Dominik Hauser 의 Chapter.1

- [[Agile] 테스트 주도 개발이란](https://gmlwjd9405.github.io/2018/06/03/agile-tdd.html)  // 읽어보시는 것 추천합니다. 알맞게 활용하는 자세?마음가짐?을 알려줘요.











