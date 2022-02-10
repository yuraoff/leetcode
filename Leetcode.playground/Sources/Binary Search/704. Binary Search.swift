import Foundation

// Easy https://leetcode.com/problems/binary-search/
public enum BinarySearch {
  public static func searchV1(_ nums: [Int], _ target: Int) -> Int {
    var mid: Int = 0
    var leftIndex = 0
    var rightIndex = nums.count - 1
    
    while leftIndex <= rightIndex {
      mid = (leftIndex + rightIndex) / 2
      let value = nums[mid]
      if target == value {
        return mid
      } else if target < nums[mid] {
        rightIndex = mid - 1
      } else {
        leftIndex = mid + 1
      }
    }
    return -1
  }
}
