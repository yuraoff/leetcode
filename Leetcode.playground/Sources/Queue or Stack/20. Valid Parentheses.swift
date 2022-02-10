import Foundation

// Easy https://leetcode.com/problems/valid-parentheses/
public enum ValidParentheses {
  
  public static func isValidV1(_ s: String) -> Bool {
    var array = [Character]()
    for symbol in s {
      if ["(", "[", "{"].contains(symbol) {
        array.append(symbol)
      } else if symbol == ")" && !array.isEmpty && array.last == "(" {
        _ = array.popLast()
      } else if symbol == "]" && !array.isEmpty && array.last == "[" {
        _ = array.popLast()
      } else if symbol == "}" && !array.isEmpty && array.last == "{" {
        _ = array.popLast()
      } else {
        return false
      }
    }
    return array.isEmpty
  }
  
  public static func isValidV2(_ s: String) -> Bool {
    var stack = Stack<Character>()
    for symbol in s {
      if ["(", "[", "{"].contains(symbol) {
        stack.push(symbol)
      } else if symbol == ")" && !stack.isEmpty && stack.peek == "(" {
        stack.pop()
      } else if symbol == "]" && !stack.isEmpty && stack.peek == "[" {
        stack.pop()
      } else if symbol == "}" && !stack.isEmpty && stack.peek == "{" {
        stack.pop()
      } else {
        return false
      }
    }
    return stack.isEmpty
  }
}
