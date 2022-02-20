import Foundation

/*
 Easy https://leetcode.com/problems/search-insert-position/
 
 Given a sorted array of distinct integers and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.
 You must write an algorithm with O(log n) runtime complexity.

 Example 1:
 Input: nums = [1,3,5,6], target = 5
 Output: 2

 Example 2:
 Input: nums = [1,3,5,6], target = 2
 Output: 1
 
 Example 3:
 Input: nums = [1,3,5,6], target = 7
 Output: 4

 Constraints:
 1 <= nums.length <= 10^4
 -10^4 <= nums[i] <= 10^4
 nums contains distinct values sorted in ascending order.
 -10^4 <= target <= 10^4
 */
public enum SearchInsertPosition{
  public static func searchInsertV1(_ nums: [Int], _ target: Int) -> Int {
    var leftPointer = 0
    var rightPointer = nums.count - 1
    var midPointer = 0
    var midValue = 0
    while leftPointer <= rightPointer {
        midPointer = (leftPointer + rightPointer) / 2
        midValue = nums[midPointer]
        if midValue < target {
            leftPointer = midPointer + 1
        } else if midValue > target {
            rightPointer = midPointer - 1
        } else {
            return midPointer
        }
    }
    return leftPointer
}
}
