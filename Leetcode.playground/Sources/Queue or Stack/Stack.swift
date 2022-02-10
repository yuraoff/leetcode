import Foundation

public struct Stack<T> {
  private var array = [T]()
  
  var isEmpty: Bool {
    array.isEmpty
  }
  
  var peek: T? {
    array.last
  }
  
  mutating func push(_ element: T) {
    array.append(element)
  }
  
  @discardableResult
  mutating func pop() -> T? {
    array.popLast()
  }
}
