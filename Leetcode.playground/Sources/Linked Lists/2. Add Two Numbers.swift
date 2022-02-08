import Foundation

public enum AddTwoNumbers {
  public static func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    let sum = toNumber(l1) + toNumber(l2)
    print(sum)
    return toListNode(sum)
  }
  
  public static func toNumber(_ head: ListNode?) -> Int {
    guard let head = head else { return 0 }
    var current: ListNode? = head
    var currentMultiplier = 1
    var result = 0
    while let currentHead = current {
      result += currentHead.val * currentMultiplier
      current = currentHead.next
      currentMultiplier *= 10
    }
    print(result)
    return result
  }
  
  public static func toListNode(_ number: Int) -> ListNode? {
    guard number != 0 else { return nil }
    var currentMultiplier = 10.0
    var currentNumber = Int((Double(number) / currentMultiplier).truncatingRemainder(dividingBy: 1) * 10)
    let head = ListNode(currentNumber)
    var currentHead = head
    while currentNumber > 0 {
      currentNumber = Int((Double(number) / currentMultiplier).truncatingRemainder(dividingBy: 1) * 10)
      let newNode = ListNode(currentNumber)
      currentHead.next = newNode
      currentHead = newNode
      currentMultiplier *= 10
    }
    return head
  }
}

