import Foundation
/*
  Given an m x n 2D binary grid grid which represents a map of '1's (land) and '0's (water), return the number of islands.
  An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.
  
 Example 1:
  Input: grid = [
    ["1","1","1","1","0"],
    ["1","1","0","1","0"],
    ["1","1","0","0","0"],
    ["0","0","0","0","0"]
  ]
  Output: 1
 
  Example 2:
  Input: grid = [
    ["1","1","0","0","0"],
    ["1","1","0","0","0"],
    ["0","0","1","0","0"],
    ["0","0","0","1","1"]
  ]
  Output: 3
   
  Constraints:
  m == grid.length
  n == grid[i].length
  1 <= m, n <= 300
  grid[i][j] is '0' or '1'.
*/

// Medium https://leetcode.com/problems/number-of-islands/
public enum NumberOfIslands {
  public static func numIslandsV1(_ grid: [[Character]]) -> Int {
    var mutableGrid = grid
    var numIslands = 0
    for rowIndex in 0..<mutableGrid.count {
      for colIndex in 0..<mutableGrid[rowIndex].count {
        if mutableGrid[rowIndex][colIndex] == "1" {
          reverseIslandsV1(&mutableGrid, row: rowIndex, col: colIndex)
          numIslands += 1
        }
      }
    }
    
    return numIslands
  }
  
  private static func reverseIslandsV1(_ grid: inout [[Character]], row: Int, col: Int) {
    if row < 0 || row >= grid.count {
      return
    }
    if col < 0 || col >= grid[row].count {
      return
    }
    if grid[row][col] == "0" {
      return
    }
    grid[row][col] = "0"

    reverseIslandsV1(&grid, row: row, col: col - 1) // left
    reverseIslandsV1(&grid, row: row, col: col + 1) // right
    reverseIslandsV1(&grid, row: row + 1, col: col) // up
    reverseIslandsV1(&grid, row: row - 1, col: col) // down
  }
}
