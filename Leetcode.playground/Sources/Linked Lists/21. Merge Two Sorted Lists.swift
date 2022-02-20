import Foundation
/*
 Easy https://leetcode.com/problems/merge-two-sorted-lists/
 
 You are given the heads of two sorted linked lists list1 and list2.
 Merge the two lists in a one sorted list. The list should be made by splicing together the nodes of the first two lists.
 Return the head of the merged linked list.

 Example 1:
 Input: list1 = [1,2,4], list2 = [1,3,4]
 Output: [1,1,2,3,4,4]

 Example 2:
 Input: list1 = [], list2 = []
 Output: []

 Example 3:
 Input: list1 = [], list2 = [0]
 Output: [0]

 Constraints:
 The number of nodes in both lists is in the range [0, 50].
 -100 <= Node.val <= 100
 Both list1 and list2 are sorted in non-decreasing order.
 */
public enum MergeTwoSortedLists {
  public static func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
    var l1Head: ListNode? = list1
    var l2Head: ListNode? = list2
    var result: ListNode?
    var lastResult: ListNode?
    while l1Head != nil || l2Head != nil {
        var currentNode: ListNode
        if l1Head == nil {
            currentNode = ListNode(l2Head!.val)
            l2Head = l2Head!.next
        } else if l2Head == nil {
            currentNode = ListNode(l1Head!.val)
            l1Head = l1Head!.next
        } else if l1Head!.val < l2Head!.val {
            currentNode = ListNode(l1Head!.val)
            l1Head = l1Head?.next
        } else {
            currentNode = ListNode(l2Head!.val)
            l2Head = l2Head?.next
        }
        if result == nil {
            result = currentNode
        } else {
            lastResult?.next = currentNode
        }
        lastResult = currentNode
    }
    return result
  }
}
