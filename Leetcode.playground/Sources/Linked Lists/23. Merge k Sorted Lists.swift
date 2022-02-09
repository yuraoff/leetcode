import Foundation

public enum MergeKsortedLists {
  public static func mergeKListsV1(_ lists: [ListNode?]) -> ListNode? {
    var numbers = [Int]()
    for head in lists {
      var currentNode: ListNode? = head
      while let current = currentNode {
        numbers.append(current.val)
        currentNode = current.next
      }
    }
    numbers.sort()
    var head: ListNode?
    var lastNode: ListNode?
    for number in numbers {
      let current = ListNode(number)
      if head == nil {
        head = current
      } else {
        lastNode?.next = current
      }
      lastNode = current
    }
    return head
  }
}
