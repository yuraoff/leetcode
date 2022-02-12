import Foundation

/**
 Medium https://leetcode.com/problems/top-k-frequent-words/
 
 Given an array of strings words and an integer k, return the k most frequent strings.
 Return the answer sorted by the frequency from highest to lowest. Sort the words with the same frequency by their lexicographical order.

 Example 1:
 Input: words = ["i","love","leetcode","i","love","coding"], k = 2
 Output: ["i","love"]
 Explanation: "i" and "love" are the two most frequent words.
 Note that "i" comes before "love" due to a lower alphabetical order.
 
 Example 2:
 Input: words = ["the","day","is","sunny","the","the","the","sunny","is","is"], k = 4
 Output: ["the","is","sunny","day"]
 Explanation: "the", "is", "sunny" and "day" are the four most frequent words, with the number of occurrence being 4, 3, 2 and 1 respectively.
  
 Constraints:
 1 <= words.length <= 500
 1 <= words[i] <= 10
 words[i] consists of lowercase English letters.
 k is in the range [1, The number of unique words[i]]
 */

public enum TopKFrequentWords {
  func topKFrequentV1(_ words: [String], _ k: Int) -> [String] {
    var dict = [String: Int]()
    for word in words {
      dict[word, default: 0] += 1
    }
    var wordFreq = [(word: String, freq: Int)]()
    for (word, freq) in dict {
      wordFreq.append((word, freq))
    }
    wordFreq.sort(by: { $0.freq == $1.freq ? $0.word < $1.word : $0.freq > $1.freq })
    return Array(wordFreq[..<k])
      .map {$0.word}
  }
  
  public static func topKFrequentV2(_ words: [String], _ k: Int) -> [String] {
    words.reduce(into: [String: Int]()) { $0[$1, default: 0] += 1 }
      .sorted(by: { $0.1 == $1.1 ? $0.0 < $1.0 : $0.1 > $1.1 })
      .prefix(k)
      .map { $0.0 }
  }
}
