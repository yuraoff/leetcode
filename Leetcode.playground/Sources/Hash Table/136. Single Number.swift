import Foundation

// Easy https://leetcode.com/problems/single-number/
public enum SingleNumber {
  
  // Bad way =)
  public static func singleNumberV1(_ nums: [Int]) -> Int {
    var dict = [Int: Int]()
    for num in nums {
      dict[num, default: 0] += 1
    }
    return dict.first(where: {_, count in count == 1 })!.key
  }
  
  //A ^ A = 0
  //A ^ 0 = A
  public static func singleNumberV2(_ nums: [Int]) -> Int {
    var result = 0
    for num in nums {
      result ^= num
      print(result, num)
    }
    return result
  }
  
  public static func singleNumberV3(_ nums: [Int]) -> Int {
    var set = Set<Int>()
    for num in nums {
      if set.contains(num) {
        set.remove(num)
      } else {
        set.insert(num)
      }
    }
    return set.first!
  }
}
