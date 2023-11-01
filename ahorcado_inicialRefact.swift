import Foundation



class PlayDangerWords {

    let wordsForTheGame: [String] = ["algorithm", "language", "compiler", "variable", "function", "loop", "class", "object", "inheritance", "polymorphism", "encapsulation", "modularity", "debugging", "integration", "development", "frontend", "backend", "database", "API", "framework", "library", "programmer", "syntax", "compilation", "interpretation", "link", "optimization", "repository", "constant"]
    var numberOfAttempts: Int = 8
    var arrayToGuessResult: [Character] = []

    func generateRandomWord() -> String {
        let randomWord = wordsForTheGame.randomElement() ?? ""
        return randomWord
    }

    func letterIdentifier(_ randomWord: String) {
        for letterEnteredByUser in randomWord {
            if arrayToGuessResult.contains(letterEnteredByUser) {
                print(letterEnteredByUser, terminator: " ")
            } else {

                print("_", terminator: " ")
            }
        }
        print()
    }

    func guessTheLetter() -> Character {
        var letterEnteredByUser: Character = " "

        while true {
            print("Enter a letter: ", terminator: "")
            if let input = readLine() {
                letterEnteredByUser = Character(input.lowercased())

                if letterEnteredByUser.isLetter && String(letterEnteredByUser).count == 1 && !arrayToGuessResult.contains(letterEnteredByUser) {
                    break
                }
            }
            print("Please enter a valid letter that you haven't guessed before.")
        }
        return letterEnteredByUser
    }

    func initDangerWords() {
        print("Welcome to the Danger Words game!")

        let secretWord = generateRandomWord()

        while true {
            letterIdentifier(secretWord)
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
                    break
                }
            }
        }
    }
}



let game = PlayDangerWords()

game.initDangerWords()
