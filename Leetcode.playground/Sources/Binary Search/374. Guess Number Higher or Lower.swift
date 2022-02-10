import Foundation

// Easy https://leetcode.com/problems/guess-number-higher-or-lower/
public enum GuessNumberHigherOrLower {
  
  public static func guessNumberV1(_ n: Int) -> Int {
    var leftIndex = 0
    var rightIndex = n
    
    while leftIndex <= rightIndex {
      let mid = (leftIndex + rightIndex) / 2
      let guessResult = guess(mid)
      if guessResult == 0 {
        return mid
      } else if guessResult == -1 {
        rightIndex = mid - 1
      } else {
        leftIndex = mid + 1
      }
    }
    
    return -1
  }
  
  private static func guess(_ num: Int) -> Int  {
    let target = 1 // Your secret value
    if num == target {
      return 0
    } else if target > num {
      return 1
    } else {
      return -1
    }
  }
}
