import Foundation

// Easy https://leetcode.com/problems/symmetric-tree/
public enum SymmetricTree {
  public static func isSymmetricV1(_ root: TreeNode?) -> Bool {
    isSymmetricEqualV1(p: root?.left, q: root?.right)
  }
  
  private static func isSymmetricEqualV1(p: TreeNode?, q: TreeNode?) -> Bool {
    if p == nil && q == nil {
      return true
    }
    if p == nil || q == nil {
      return false
    }
    if p?.val != q?.val {
      return false
    }
    return isSymmetricEqualV1(p: p?.left, q: q?.right) && isSymmetricEqualV1(p: p?.right, q: q?.left)
  }
}
