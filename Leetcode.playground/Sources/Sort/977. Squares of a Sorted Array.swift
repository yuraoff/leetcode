import Foundation

/*
 Easy https://leetcode.com/problems/squares-of-a-sorted-array/description/
 
 Given an integer array nums sorted in non-decreasing order, return an array of the squares of each number sorted in non-decreasing order.

 Example 1:
 Input: nums = [-4,-1,0,3,10]
 Output: [0,1,9,16,100]
 Explanation: After squaring, the array becomes [16,1,0,9,100].
 After sorting, it becomes [0,1,9,16,100].
 
 Example 2:
 Input: nums = [-7,-3,2,3,11]
 Output: [4,9,9,49,121]

 Constraints:
 1 <= nums.length <= 10^4
 -10^4 <= nums[i] <= 10^4
 nums is sorted in non-decreasing order.
 */
public enum SquaresOfASortedArray {
  public static func sortedSquaresV1(_ nums: [Int]) -> [Int] {
    var result = Array(repeating: 0, count: nums.count)
    var leftPoinet = 0
    var rightPointer = nums.count - 1
    var resultPointer = result.count - 1
    var leftSqr = 0
    var rightSqr = 0
    while leftPoinet <= rightPointer {
      leftSqr = nums[leftPoinet] * nums[leftPoinet]
      rightSqr = nums[rightPointer] * nums[rightPointer]
      if leftSqr > rightSqr {
        result[resultPointer] = leftSqr
        leftPoinet += 1
        resultPointer -= 1
      } else {
        result[resultPointer] = rightSqr
        rightPointer -= 1
        resultPointer -= 1
      }
    }
    return result
  }
}
