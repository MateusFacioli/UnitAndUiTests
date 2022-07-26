import XCTest
@testable import BullsEye

class BullsEyeTests: XCTestCase {
  var sut: BullsEyeGame! //System Under Test


    override func setUpWithError() throws {
      try super.setUpWithError()
      sut = BullsEyeGame()
    }

    override func tearDownWithError() throws {
      sut = nil
      try super.tearDownWithError()
    }
  
  func testScoreIsComputedWhenGuessIsHigherThanTarget() {
    // given
    let guess = sut.targetValue + 5
    
    // when
    sut.check(guess: guess)
    
    // then
    XCTAssertEqual(sut.scoreRound, 95, "Score computed from guess is wrong")
  }
  
  func testScoreIsComputedWhenGuessIsLowerThanTarget() {
    // given
    let guess = sut.targetValue - 5

    // when
    sut.check(guess: guess)

    // then
    XCTAssertEqual(sut.scoreRound, 95, "Score computed from guess is wrong")
  }
  
  func testScoreIsComputedPerformance() {
    measure(
      metrics: [
        XCTClockMetric(),//measures elapsed time
        XCTCPUMetric(),//keeps track of CPU activity including CPU time, cycles and number of instructions
        XCTStorageMetric(),//tells you how much data the tested code writes to storage
        XCTMemoryMetric()//tracks the amount of used physical memory
      ]
    ) {
      sut.check(guess: 100)
    }
  }




}
