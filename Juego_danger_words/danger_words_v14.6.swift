import Foundation

class PlayDangerWords {
 
    let wordsForTheGame: [String] = ["algorithm", "language", "compiler", "variable", "function", "loop", "class", "object", "inheritance", "polymorphism", "encapsulation", "modularity", "debugging", "integration", "development", "frontend", "backend", "database", "API", "framework", "library", "programmer", "syntax", "compilation", "interpretation", "link", "optimization", "repository", "constant"]
    var numberOfAttemps: Int = 8
    var arrayToGuessLetter: [Character] = []
    var characterArray: [Character]
    
    
    //inicializador de las variables
    init(arrayToGuessLetter: [Character], gameWord: String, characterArray: [Character]) {
        self.arrayToGuessLetter = arrayToGuessLetter
        self.characterArray = characterArray
    }
    
    var letterEnteredByUser = Character((readLine() ?? "").lowercased())
    
    //Generador de una palabra aleatoria dentro del array wordsForTheGame
    func generateFromRandomWord(_ wordsForTheGame: [String]) -> String {
        let randomWord = wordsForTheGame.randomElement() ?? ""
        return randomWord
    }
    //Identificador de una letra en una palabra
    func letterIdentifierL(_ randomWord: String, _ characterArray: [Character]) {
        for letterEnteredByUser in randomWord {
            if characterArray.contains(letterEnteredByUser) {
                print(letterEnteredByUser, terminator: " ")
            } else {
                print("_", terminator: " ")
            }
        }
        print()
    }
    //Busqueda de una letra solicitada al usuario dentro de un array de caracteres
    func guessTheLetter(_ characterArray: [Character]) -> Character {
        print("Enter a letter: ", terminator: "")

        
        while letterEnteredByUser.isLetter == false || Sring(letterEnteredByUser ).count != 1 {
            print("Please enter only one letter: ", terminator: "")
            letterEnteredByUser = Character((readLine() ?? "").lowercased())
        }
        while characterArray.contains(letter) {
            print("You already guessed that letter, try another one: ", terminator: "")
            letterEnteredByUser  = Character((readLine() ?? "").lowercased())
        }
        return letterEnteredByUser
    }
    //Generador del juego
    func initdangerWords(_ arrayToGuessLetter: [Character]) {
        print("Welcome to the Danger Words game!")
        let secretWord = generateFromRandomWord (wordsForTheGame)
        while true {
            
            letterIdentifierL(secretWord, arrayToGuessLetter)
            let guessResult = guessTheLetter(arrayToGuessLetter)
            
            if secretWord.contains(guessResult) {
                arrayToGuessLetter.append(guessResult)
                print("Well done! You guessed a letter.")
            } else {
                numberOfAttemps -= 1
                print("Sorry, that letter is not in the word.")
                print("You have \(numberOfAttemps) lives remaining.")
                
                if numberOfAttemps == 0 {
                    print("Game Over! The word was: \(secretWord)")
                    break
                } else if Set(secretWord).isSubset(of: Set(guessTheLetter)) {
                    print("Congratulations! You guessed the word: \(secretWord)")
                    break
                }
            }
        }
    }
    
}

let game = PlayDangerWords()
    game.initdangerWords(["a", "b", "c"])
