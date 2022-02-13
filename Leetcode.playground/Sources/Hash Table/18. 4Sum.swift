import Foundation

/*
 Medium https://leetcode.com/problems/4sum/
 
 Given an array nums of n integers, return an array of all the unique quadruplets [nums[a], nums[b], nums[c], nums[d]] such that:
 0 <= a, b, c, d < n
 a, b, c, and d are distinct.
 nums[a] + nums[b] + nums[c] + nums[d] == target
 You may return the answer in any order.

 Example 1:
 Input: nums = [1,0,-1,0,-2,2], target = 0
 Output: [[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]
 
 Example 2:
 Input: nums = [2,2,2,2,2], target = 8
 Output: [[2,2,2,2]]

 Constraints:
 1 <= nums.length <= 200
 -109 <= nums[i] <= 109
 -109 <= target <= 109
 */

public enum FourSum {
  public static func fourSumV1(_ nums: [Int], _ target: Int) -> [[Int]] {
    var result = [[Int]]()
    for (firstIndex, firstNum) in nums.enumerated() {
      for (secondIndex, secondNum) in nums.enumerated() {
        for (thirdIndex, thirdNum) in nums.enumerated() {
          for (fourthIndex, fourthNum) in nums.enumerated() {
            guard firstIndex != secondIndex && secondIndex != thirdIndex && thirdIndex != fourthIndex else { continue }
            if (firstNum + secondNum + thirdNum + fourthNum) == target {
              result.append([firstNum, secondNum, thirdNum, fourthNum])
            }
          }
        }
      }
    }
    
    return result
  }
  public static func fourSumV2(_ nums: [Int], _ target: Int) -> [[Int]] {
    var uniqIndexComb = Set<[Int]>()
    for (extIndex, _) in nums.enumerated() {
      for (innerIndex, _) in nums.enumerated() {
        guard extIndex != innerIndex else { continue }
        uniqIndexComb.insert(extIndex < innerIndex ? [extIndex, innerIndex] : [innerIndex, extIndex])
      }
    }
    var indexComb = [[Int]]()
    var numCombs = [[Int]]()
    var numSums = [Int]()
    for indexes in uniqIndexComb.sorted(by: { $0[0] < $1[0] }) {
      indexComb.append(indexes)
      numCombs.append([nums[indexes[0]], nums[indexes[1]]])
      numSums.append(nums[indexes[0]] + nums[indexes[1]])
    }
    var result = Set<[Int]>()
    var dict = [Int: [Int]]()
    for (index, firstComb) in indexComb.enumerated() {
      let needSum = target - numCombs[index][0] - numCombs[index][1]
      if let findedSum = dict[needSum] {
        result.insert([numCombs[index][0], numCombs[index][1], numCombs[findedSum][0], numCombs[findedSum][1]])
      } else {
        dict[numCombs[index][0] + numCombs[index][1]] = firstComb
      }
    }
    return Array(result)
  }
}
