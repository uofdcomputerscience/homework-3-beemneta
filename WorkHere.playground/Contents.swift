import Foundation

// This homework should be fairly simple.
// visit https://github.com/noops-challenge/wordbot to read
// the documentation for wordbot.
//
// Using that documentation, write a playground that does
// the following:
// download 50 words
// decode those 50 words into an array of strings
// print the array of words, but with each word reversed
// print the average number of characters per word
let web = "https://github.com/noops-challenge/wordbot?count=50"

struct Words: Codable {
  let names: [String]
}

func printReversedWords (list: [String]) {
  for word in list {
    print(String (word.reversed()))
  }
}

func printAverageCharacterPerWord (list: [String]) {
  var numCharacters = 0
  for word in list {
    numCharacters = numCharacters + word.count
  }
    let avgNumCharacters = numCharacters/50     //divide by 50 because we are working with 50 words here
    print(avgNumCharacters)
    
}

if let url = URL (string: web) {
  let request = URLRequest(url: url)
  let session = URLSession(configuration: .ephemeral)
  
  let task = session.dataTask(with: request) { (data, response, error) in
    let wordList = try! JSONDecoder().decode (Words.self, from: data!)
    printReversedWords(list: wordList.names)
    printAverageCharacterPerWord(list: wordList.names)
  }
  task.resume()
}
