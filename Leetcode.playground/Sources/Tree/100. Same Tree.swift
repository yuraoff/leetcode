import Foundation

// Easy https://leetcode.com/problems/same-tree/
public enum SameTree {
  public static func isSameTreeV1(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    if p == nil && q == nil {
      return true
    }
    if p == nil || q == nil {
      return false
    }
    if p?.val != q?.val {
      return false
    }
    return isSameTreeV1(p?.left, q?.left) && isSameTreeV1(p?.right, q?.right)
  }
}
