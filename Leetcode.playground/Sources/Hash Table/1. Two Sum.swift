import Foundation

// Easy https://leetcode.com/problems/two-sum/
public enum TwoSum {
  public static func twoSumV1(_ nums: [Int], _ target: Int) -> [Int] {
    var dict = [Int: Int]() // [Value: Index]
    for (index, num) in nums.enumerated() {
      let diff = target - num
      if let diffIndex = dict[diff] {
        return [index, diffIndex]
      }
      dict[num] = index
    }
    return []
  }

  // Brutforce
  public static func twoSumV2(_ nums: [Int], _ target: Int) -> [Int] {
    for (firstIndex, firstValue) in nums.enumerated() {
      for (secondIndex, secondValue) in nums.enumerated() {
        guard firstIndex != secondIndex else { continue }
        if firstValue + secondValue == target {
          return [firstIndex, secondIndex]
        }
      }
    }
    return []
  }
}
