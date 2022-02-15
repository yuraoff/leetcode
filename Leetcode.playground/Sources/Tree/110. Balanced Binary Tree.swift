import Foundation
/*
 Easy https://leetcode.com/problems/balanced-binary-tree/
 
 Given a binary tree, determine if it is height-balanced.
 For this problem, a height-balanced binary tree is defined as:
 a binary tree in which the left and right subtrees of every node differ in height by no more than 1.

 Example 1:

 Input: root = [3,9,20,null,null,15,7]
 Output: true
 
 Example 2:
 Input: root = [1,2,2,3,3,null,null,4,4]
 Output: false
 
 Example 3:
 Input: root = []
 Output: true

 Constraints:
 The number of nodes in the tree is in the range [0, 5000].
 -104 <= Node.val <= 104
 */
public enum BalancedBinaryTree {
  public static func isBalancedV1(_ root: TreeNode?) -> Bool {
    func height(_ root: TreeNode?) -> Int {
      guard let root = root else { return 0 }
      if root.left == nil && root.right == nil { return 1 }
      let leftHeight = height(root.left)
      let rightHeight = height(root.right)
      
      return max(leftHeight, rightHeight) + 1
    }
    guard let root = root else { return true }
    if root.left == nil && root.right == nil {
      return true
    }
    let leftHeight = height(root.left)
    let rightHeight = height(root.right)
    
    return isBalancedV1(root.left) && isBalancedV1(root.right) && abs(leftHeight - rightHeight) <= 1
  }
}
