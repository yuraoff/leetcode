import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

public func toListNode(_ array: [Int]) -> ListNode? {
  var head: ListNode?
  var lastNode: ListNode?
  for element in array {
    let currentHead = ListNode(element)
    if head == nil {
      head = currentHead
    } else {
      lastNode?.next = currentHead
    }
    lastNode = currentHead
  }
  return head
}
