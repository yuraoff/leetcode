import Foundation
/*
 Medium https://leetcode.com/problems/top-k-frequent-elements/
 
 Given an integer array nums and an integer k, return the k most frequent elements. You may return the answer in any order.

 Example 1:
 Input: nums = [1,1,1,2,2,3], k = 2
 Output: [1,2]
 
 Example 2:
 Input: nums = [1], k = 1
 Output: [1]

 Constraints:
 1 <= nums.length <= 105
 k is in the range [1, the number of unique elements in the array].
 It is guaranteed that the answer is unique.
 */

public enum TopKFrequentElements {
  public static func topKFrequentV1(_ nums: [Int], _ k: Int) -> [Int] {
    nums.reduce(into: [Int: Int]()) { $0[$1, default: 0] += 1 }
    .sorted { $0.1 > $1.1 }
    .prefix(k)
    .map { $0.0 }
  }
}
