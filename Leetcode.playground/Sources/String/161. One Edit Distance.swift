import Foundation

/*
 https://leetcode.com/problems/one-edit-distance/
 
 Given two strings s and t, return true if they are both one edit distance apart, otherwise return false.

 A string s is said to be one distance apart from a string t if you can:

 Insert exactly one character into s to get t.
 Delete exactly one character from s to get t.
 Replace exactly one character of s with a different character to get t.
 
 Example 1:
 Input: s = "ab", t = "acb"
 Output: true
 Explanation: We can insert 'c' into s to get t.
 
 Example 2:
 Input: s = "", t = ""
 Output: false
 Explanation: We cannot get t from s by only one step.
 
 Example 3:
 Input: s = "a", t = ""
 Output: true
 
 Example 4:
 Input: s = "", t = "A"
 Output: true
 
 Constraints:
 0 <= s.length <= 10^4
 0 <= t.length <= 10^4
 s and t consist of lower-case letters, upper-case letters and/or digits.
 */

public enum OneEditDistance {
  public static func isOneEditDistance(_ s: String, _ t: String) -> Bool {
    if s == t { return false }
    let diffLength = abs(s.count - t.count)
    if diffLength > 1 { return false }
    
    if diffLength == 0 {
      var diffCount = 0
      for index in 0..<s.count {
        if s[index] != t[index] {
          diffCount += 1
        }
      }
      if diffCount > 1 {
        return false
      } else {
        return true
      }
    }
    
    let longest = s.count > t.count ? s : t
    let smallest = t.count > s.count ? t : s
    var longestWithoutOneChar = ""
    for index in 0..<longest.count {
      longestWithoutOneChar = String(longest.prefix(index + 1)) + String(longest.suffix(index + 2))
      if longestWithoutOneChar == smallest {
        return true
      }
    }
    return false
  }
}

extension StringProtocol {
  subscript(offset: Int) -> Character {
    self[index(startIndex, offsetBy: offset)]
  }
}
