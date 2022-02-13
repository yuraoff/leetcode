import Foundation

/*
 Medium https://leetcode.com/problems/search-a-2d-matrix

 Write an efficient algorithm that searches for a value target in an m x n integer matrix matrix. This matrix has the following properties:
 Integers in each row are sorted from left to right.
 The first integer of each row is greater than the last integer of the previous row.

 Example 1:
 Input: matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 3
 Output: true
 
 Example 2:
 Input: matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 13
 Output: false

 Constraints:
 m == matrix.length
 n == matrix[i].length
 1 <= m, n <= 100
 -104 <= matrix[i][j], target <= 104
 */

public enum Search2DMatrix {
  public static func searchMatrixV1(_ matrix: [[Int]], _ target: Int) -> Bool {
    let mergedNums = matrix.flatMap { $0 }
    var leftPointer = 0
    var rightPointer = mergedNums.count - 1
    var midPointer = 0
    while leftPointer <= rightPointer {
      midPointer = (leftPointer + rightPointer) / 2
      let val = mergedNums[midPointer]
      if val < target {
        leftPointer = midPointer + 1
      } else if val > target {
        rightPointer = midPointer - 1
      } else {
        return true
      }
    }
    return false
  }
  
  public static func searchMatrixV2(_ matrix: [[Int]], _ target: Int) -> Bool {
    func binarySearch(_ nums: [Int], _ target: Int) -> Bool {
      var leftPointer = 0
      var rightPointer = nums.count - 1
      var midPointer = 0
      while leftPointer <= rightPointer {
        midPointer = (leftPointer + rightPointer) / 2
        let val = nums[midPointer]
        if val < target {
          leftPointer = midPointer + 1
        } else if val > target {
          rightPointer = midPointer - 1
        } else {
          return true
        }
      }
      return false
    }
    
    var topPointer = 0
    var bottomPointer = matrix.count - 1
    var midPointer = 0
    while topPointer <= bottomPointer {
      midPointer = (topPointer + bottomPointer) / 2
      let row = matrix[midPointer]
      let firstNum = row[0]
      let lastNum = row[row.count - 1]
      if firstNum <= target && lastNum >= target {
        return binarySearch(row, target)
      } else if lastNum < target {
        topPointer = midPointer + 1
      } else {
        bottomPointer = midPointer - 1
      }
    }
    return false
  }
  
  public static func searchMatrixV3(_ matrix: [[Int]], _ target: Int) -> Bool {
    let countNumInRow = matrix[0].count
    var leftPointer = 0
    var rightPointer = matrix.count * countNumInRow - 1
    var midPointer = 0
    var elementValue = 0
    while leftPointer <= rightPointer {
      midPointer = (leftPointer + rightPointer) / 2
      elementValue = matrix[midPointer / countNumInRow][midPointer % countNumInRow]
      if elementValue < target {
        leftPointer = midPointer + 1
      } else if elementValue > target {
        rightPointer = midPointer - 1
      } else {
        return true
      }
    }
    return false
  }
}
