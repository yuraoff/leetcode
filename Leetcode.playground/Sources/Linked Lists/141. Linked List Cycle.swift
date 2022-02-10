import Foundation

// Easy https://leetcode.com/problems/linked-list-cycle/
public enum LinkedListCycle {
  public static func hasCycleV1(_ head: ListNode?) -> Bool {
    var slowPointer = head
    var fastPointer = head
    while fastPointer?.next != nil, fastPointer?.next?.next != nil {
      slowPointer = slowPointer?.next
      fastPointer = fastPointer?.next?.next
      if slowPointer === fastPointer {
        return true
      }
    }
    return false
  }
  
  public static func hasCycleV2(_ head: ListNode?) -> Bool {
    var array = [ListNode]()
    var current: ListNode? = head
    while current != nil {
      if array.contains(where: { $0 === current }) {
        return true
      } else {
        array.append(current!)
      }
      current = current?.next
    }
    return false
  }
}
