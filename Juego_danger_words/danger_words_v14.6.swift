import Foundation

class PlayDangerWords {
 
    let wordsForTheGame: [String] = ["algorithm", "language", "compiler", "variable", "function", "loop", "class", "object", "inheritance", "polymorphism", "encapsulation", "modularity", "debugging", "integration", "development", "frontend", "backend", "database", "API", "framework", "library", "programmer", "syntax", "compilation", "interpretation", "link", "optimization", "repository", "constant"]
    let secret: "String"
    var guessed: [Character] = []
    var trys: Int
    
    init(guessed: [Character], trys: Int, secret: "String", word: String, characterArray: [Character]) {
        self.guessed = guessed
        self.trys = trys
        self.secret = secret
        self.word = word
        self.characterArray = characterArray
    }
    
    //Generador de una palabra aleatoria dentro del array 
    func generateFromRandomWord( wordsForTheGame: [String]) -> String {
        let randomWord = wordsForTheGame.randomElement() ?? ""
        return randomWord
    }
    func letterIdentifierL( word: String, characterArray: [Character]) {
        for l in word {
            if characterArray.contains(l) {
                print(l, terminator: " ")
            } else {
                print("_", terminator: " ")
            }
        }
        print()
    }
    func guessTheLetter( characterArray: [Character]) -> Character {
        print("Enter a letter: ", terminator: "")
        var letterEnteredByUser = Character((readLine() ?? "").lowercased())
        
        while letterEnteredByUser.isLetter == false || String(letterEnteredByUser ).count != 1 {
            print("Please enter only one letter: ", terminator: "")
            letterEnteredByUser = Character((readLine() ?? "").lowercased())
        }
        while characterArray.contains(l) {
            print("You already guessed that letter, try another one: ", terminator: "")
            letterEnteredByUser  = Character((readLine() ?? "").lowercased())
        }
        return letterEnteredByUser
    }
    func dangerWords(secret: String, guessed: [Character] = [], trys = Int) {
        print("Welcome to the Danger Words game!")
        
        while true {
            sw(secret, guessed)
            let L = take(guessed)
            
            if secret.contains(L) {
                guessed.append(L)
                print("Well done! You guessed a letter.")
            } else {
                trys -= 1
                print("Sorry, that letter is not in the word.")
                print("You have \(trys) lives remaining.")
                
                if trys == 0 {
                    print("Game Over! The word was: \(secret)")
                    break
                } else if Set(secret).isSubset(of: Set(guessed)) {
                    print("Congratulations! You guessed the word: \(secret)")
                    break
                }
            }
        }
    }
    
}
var trys = 8
let secret = cw(w)
PlayDangerWords()
