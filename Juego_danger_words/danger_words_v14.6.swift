import Foundation

class PlayDangerWords {
    let wordsForTheGame: [String] = ["algorithm", "language", "compiler", "variable", "function", "loop", "class", "object", "inheritance", "polymorphism", "encapsulation", "modularity", "debugging", "integration", "development", "frontend", "backend", "database", "API", "framework", "library", "programmer", "syntax", "compilation", "interpretation", "link", "optimization", "repository", "constant"]
    var numberOfAttempts: Int = 8
    var arrayToGuessResult: [Character] = []

    init(arrayToGuessLetter: [Character], characterArray: [Character]) {
        self.arrayToGuessLetter = arrayToGuessLetter
        self.characterArray = characterArray
    }
    func generateRandomWord(_ wordsForTheGame: [String]) -> String {
        let randomWord = wordsForTheGame.randomElement() ?? ""
        debugPrint("la palabra seleccionada es: \(randomWord) generada en la linea 13")
        return randomWord
    }
    
    var letterEnteredByUser = Character((readLine() ?? "").lowercased())

    // Identify letters in a word
    func letterIdentifier(_ randomWord: String, _ characterArray: [Character]) {
        for letterEnteredByUser in randomWord {
            if characterArray.contains(letterEnteredByUser) {
                print(letterEnteredByUser, terminator: " ")
            } else {
                print("_", terminator: " ")
            }
        }
        print()
    }

    // Guess a letter
    func guessTheLetter() -> Character {
        var letterEnteredByUser = Character((readLine() ?? "").lowercased())
        print("Enter a letter: ", terminator: "")
        debugPrint("la palabra secreta es: \(secretWord) en la linea 35")

        while letterEnteredByUser.isLetter == false || String(letterEnteredByUser).count != 1 {
            print("Please enter only one letter: ", terminator: "")
            letterEnteredByUser = Character((readLine() ?? "").lowercased())
        }

        while arrayToGuessResult.contains(letterEnteredByUser) {
            print("You already guessed that letter, try another one: ", terminator: "")
            letterEnteredByUser = Character((readLine() ?? "").lowercased())
        }

        return letterEnteredByUser
    }

    // Initialize the Danger Words game
    func initDangerWords() {
        print("Welcome to the Danger Words game!")
        let secretWord = generateRandomWord(wordsForTheGame)
        debugPrint("la palabra secreta es: \(secretWord) en la linea 53")
        while true {
            letterIdentifier(secretWord, arrayToGuessResult)
            let guessResult = guessTheLetter()
           
            if secretWord.contains(guessResult) {
                arrayToGuessResult.append(guessResult)
                print("Well done! You guessed a letter.")
            } else {
                numberOfAttempts -= 1
                print("Sorry, that letter is not in the word.")
                print("You have \(numberOfAttempts) lives remaining.")

                if numberOfAttempts == 0 {
                    print("Game Over! The word was: \(secretWord)")
                    break
                } else if Set(secretWord).isSubset(of: Set(arrayToGuessResult)) {
                    print("Congratulations! You guessed the word: \(secretWord)")
                    debugPrint("la palabra secreta es: \(secretWord) en la linea 71")

                    break
                }
            }
        }
    }
}

let game = PlayDangerWords()
game.initDangerWords()


