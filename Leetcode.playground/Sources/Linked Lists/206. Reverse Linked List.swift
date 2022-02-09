import Foundation

public enum ReverseLinkedList {
  public static func reverseListV1(_ head: ListNode?) -> ListNode? {
    var reversedHead: ListNode?
    var currentHead = head
    while let head = currentHead {
      let tail = head.next
      head.next = reversedHead
      reversedHead = head
      currentHead = tail
    }
    return reversedHead
  }
}
