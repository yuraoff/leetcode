import Foundation

// https://leetcode.com/problems/add-two-numbers/
public enum AddTwoNumbers {
  public static func addTwoNumbersV1(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var inMemoryValue: Int = 0
    var l1Head: ListNode? = l1
    var l2Head: ListNode? = l2
    var resultHead: ListNode?
    var lastResultHead: ListNode?
    while l1Head != nil || l2Head != nil {
      if let currentL1Head = l1Head {
        inMemoryValue += currentL1Head.val
        l1Head = currentL1Head.next
      }
      if let currentL2Head = l2Head {
        inMemoryValue += currentL2Head.val
        l2Head = currentL2Head.next
      }
      
      let currentResultListNode = ListNode(inMemoryValue % 10)
      inMemoryValue = inMemoryValue / 10
      
      if resultHead == nil {
        resultHead = currentResultListNode
      } else {
        lastResultHead?.next = currentResultListNode
      }
      lastResultHead = currentResultListNode
    }
    
    if inMemoryValue > 0 {
      lastResultHead?.next = ListNode(inMemoryValue)
    }
    
    return resultHead
  }
}

