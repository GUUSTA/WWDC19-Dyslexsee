/*:

 # Dyslexsee

 ## What is Dyslexia?

 According to the International Dyslexia Association [here](https://dyslexiaida.org/definition-of-dyslexia/) 📖

  ---

 *“Dyslexia is a specific learning disability that is neurobiological in origin. It is characterized by difficulties with accurate and/or fluent word recognition and by poor spelling and decoding abilities. These issue typically result from a deficit in the phonological component of language that is often unexpected in relation to other cognitive abilities and the provision of effective classroom instruction. Secondary consequences may include problems in reading comprehension and reduced reading experience that can impede growth of vocabulary and background knowledge.”*

 ---

 ## How does a person with Dyslexia read? 🤔

 To show this *experience*, I did a **Dyslexia Effect** named **Dyslexsee**, based on interviews with people that are dyslexic. They told that when you try to read a text, the letters look to be **dancing** or **trading**.

 ## How is this experience?

 Generally the most common symptoms of Dyslexia are:

* Letter reversals - **d** for **b**
* Word reversals - **tip** for **pit**
* Inversions - **m** for **w**, **u** for **n**, **6** for **9**
* Transpositions - **felt** for **left**
* Confuse with small words - **at** for **to**, **said** for **and**, **does** for **goes**

 # Goal

 Try to read the text with Dyslexia Effect enabled and type your personal response! 😎

*/
//#-hidden-code
import UIKit
import PlaygroundSupport

var dyslexiaEffect = false // The variable to set the dyslexia effect to enabled or disabled

class DyslexiaViewController : UIViewController {

    // Aux variables
    let time: TimeInterval = 0.7 // Timer interval to timer
    var seconds: Int = 0 // Integer secounds to timer
    var timer: Timer!
    var words: [String] = [String]() // We are going to use this array for index words of the text
    var wordsCopy: [String] = [String]() // A copy of the array
    var textCompleted: String = "   The film “Like stars on Earth (2007)”, directed by Aamir Khan, tells the story of Ishaan, a 9-year-old boy who suffers from dyslexia. The little boy goes through learning difficulties, where he is not able to read and write. In one of the scenes, his teacher asks him to read a text, and he says he is not able to do it because the letters are ”dancing”. When his teacher hears his story, he gets mad and takes his out of the classroom. Everything changes when Ram Shankar Nikumbh, the new teacher, arrives and recognizes that Ishaan has dyslexia and decides to take the boy out from the abyss he was in. He taught Ishaan to read and write regardless of his condition, and from that moment the boy overcomes all the challenges he had and school starts to get a whole new meaning for him. \n \n   Suppose that a few years later Ishaan gets very interested in learning to code and becomes a fan of the development of new technologies. After overcoming several learning obstacles, Ishaan finds a great opportunity to show off his talent: The WWDC 2019 Scholarships! \n \n    What advice would you give to young Ishaan? What should our character do to get his project approved?" // Here we have a text about a fictional story, but it's possible to happen

    // User variables
    var text: String = "" // The user may type the anwser.

    var textColor = #colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)

    // Labels
    var wwdcLabel = UILabel()
    var lbl2019 = UILabel()
    var appleLabel = UILabel()
    var submissionLabel = UILabel()
    var scholarshipLabel = UILabel()
    var letter = UILabel()

    //Image Views
    var background = UIImageView(image: UIImage(named: "background"))

    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        // Configurando
        appleLabel.text = ""
        appleLabel.textAlignment = .center
        appleLabel.textColor = #colorLiteral(red: 0.4235294118, green: 0.4862745098, blue: 0.4745098039, alpha: 1)
        appleLabel.font = UIFont.boldSystemFont(ofSize: 26)

        wwdcLabel.text = "WWDC"
        wwdcLabel.textAlignment = .center
        wwdcLabel.textColor = #colorLiteral(red: 0.4235294118, green: 0.4862745098, blue: 0.4745098039, alpha: 1)
        wwdcLabel.font = UIFont.boldSystemFont(ofSize: 26)

        lbl2019.text = "2019"
        lbl2019.textAlignment = .center
        lbl2019.textColor = #colorLiteral(red: 0.4235294118, green: 0.4862745098, blue: 0.4745098039, alpha: 1)
        lbl2019.font = UIFont.boldSystemFont(ofSize: 26)

        scholarshipLabel.text = "Scholarship"
        scholarshipLabel.textAlignment = .center
        scholarshipLabel.textColor = #colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)
        scholarshipLabel.font = UIFont(name: "Courier", size: 20)

        submissionLabel.text = "submission"
        submissionLabel.textAlignment = .center
        submissionLabel.textColor = #colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)
        submissionLabel.font = UIFont(name: "Courier", size: 20)

        letter.font = UIFont(name: "Courier", size: 18)
        letter.textAlignment = .justified
        letter.numberOfLines = 30
        letter.lineBreakMode = .byWordWrapping

//#-end-hidden-code

/*:
 For you to enable the Dyslexia Effect 🥳
 - Example: dyslexiaEffect = true
 */
//#-code-completion(everything, hide)
//#-code-completion(identifier, show, "Type something here", true, false)
dyslexiaEffect = /*#-editable-code*/false/*#-end-editable-code*/
/*:
You can touch in the box below and type your amazing text! 🔖

- Example: text = "Your anwser..."
*/
text = /*#-editable-code*/"           "/*#-end-editable-code*/
/*:
You can touch the cool colored square and pick up a different one! 😱
*/
textColor = /*#-editable-code*/#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)/*#-end-editable-code*/
       //#-hidden-code

        letter.textColor = textColor
        letter.text = textCompleted + " \n \n " + text
        view.addSubview(background)
        view.addSubview(appleLabel)
        view.addSubview(wwdcLabel)
        view.addSubview(lbl2019)
        view.addSubview(submissionLabel)
        view.addSubview(scholarshipLabel)
        view.addSubview(letter)
        self.view = view

        if dyslexiaEffect && text != "" {
            PlaygroundPage.current.assessmentStatus = .pass(message: "## Congratulations! You did it! Great answer 🤩🥳🎉 \n\n[**Next Page**](@next)")
        }

        if dyslexiaEffect {
            getWords(text: letter.text!)
            wordsCopy = words
            runTimer()
        } else {
            PlaygroundPage.current.assessmentStatus = .fail(hints: ["You can answer the question by typing something in the 'text'. 🤔"], solution: nil)
        }
    }

    //Set constraints of the imageView and labels
    public override func viewDidLayoutSubviews() {
        background.translatesAutoresizingMaskIntoConstraints = false
        background.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        background.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        background.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        background.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true

        wwdcLabel.translatesAutoresizingMaskIntoConstraints = false
        wwdcLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -20).isActive = true
        wwdcLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 82).isActive = true

        lbl2019.translatesAutoresizingMaskIntoConstraints = false
        lbl2019.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 60).isActive = true
        lbl2019.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 82).isActive = true

        appleLabel.translatesAutoresizingMaskIntoConstraints = false
        appleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -75).isActive = true
        appleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 82).isActive = true

        submissionLabel.translatesAutoresizingMaskIntoConstraints = false
        submissionLabel.translatesAutoresizingMaskIntoConstraints = false
        submissionLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 70).isActive = true
        submissionLabel.topAnchor.constraint(equalTo: self.wwdcLabel.topAnchor, constant: 90).isActive = true

        scholarshipLabel.translatesAutoresizingMaskIntoConstraints = false
        scholarshipLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -70).isActive = true
        scholarshipLabel.topAnchor.constraint(equalTo: self.wwdcLabel.topAnchor, constant: 90).isActive = true

        letter.translatesAutoresizingMaskIntoConstraints = false
        letter.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        letter.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        letter.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        letter.topAnchor.constraint(equalTo: self.submissionLabel.topAnchor, constant: 70).isActive = true
        letter.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -150).isActive = true
    }

    // This function receives the main text as a parameter, and encapsulates each word of the text as an indexer in an array.
    func getWords(text: String) {
        var index: Int = 0
        words.append("")

        for letter in text {
            if letter == "," || letter == "." {
                index += 1
                words.append("")
                words[index] += "\(letter)"
            } else if letter != " " {
                words[index] += "\(letter)"
            } else {
                index += 1
                words.append("")
            }
        }
    }

    // This function get the words in the array, merge each word with a empty string "text", and check if the text completed has any letter or word related with dyslexia symptoms.
    func setNewWords() {
        var i: Int = 0
        var text: String = ""

        for i in i..<words.count {
            text += "\(words[i]) "
        }

        text = text.replacingOccurrences(of: " ,", with: ",")
        text = text.replacingOccurrences(of: " .", with: ".")
        text = text.replacingOccurrences(of: "tip", with: "pit")
        text = text.replacingOccurrences(of: "m", with: "w")
        text = text.replacingOccurrences(of: "d", with: "b")
        text = text.replacingOccurrences(of: "u", with: "n")
        text = text.replacingOccurrences(of: "m", with: "n")
        text = text.replacingOccurrences(of: "v", with: "f")
        text = text.replacingOccurrences(of: "at", with: "to")
        text = text.replacingOccurrences(of: "said", with: "and")
        text = text.replacingOccurrences(of: "does", with: "goes")

        letter.text = text
        view.addSubview(letter)
    }

    // This function get a word, choose two random letters and change the location at the word each other.
    func changeLetters(word: String) -> String {
        // If the word seleted has just one letter, It does't do the process.
        guard word.count > 1 else {
            return word
        }
        var wordDict: Dictionary<Int, String> = [Int: String]()
        var count: Int = 0
        var j: Int = 0
        var letters = [Int]()
        var wordCopied: String = ""
        var aux: String = ""

        for i in word {
            wordDict.updateValue("\(i)", forKey: count)
            count += 1
        }
        letters = selectLetters(word: word)
        aux = wordDict[letters[0]]!
        wordDict.updateValue(wordDict[letters[1]]!, forKey: letters[0])
        wordDict.updateValue(aux, forKey: letters[1])

        for i in 0..<word.count {
            if i == j {
                wordCopied += wordDict[i]!
                j += 1
            }
        }
        return wordCopied
    }

    // This function receive a word, choose random index of the word, in this case a index related with the letters, and return these index.
    func selectLetters(word: String) -> [Int] {

        var gotIt: Bool = false
        var letters: [Int] = [Int]()

        while !gotIt {
            letters.append(Int.random(in: 0..<word.count))
            letters.append(Int.random(in: 0..<word.count))
            if letters[0] == 0 || letters[1] == word.count - 1 {
                letters[0] = 0
                letters[1] = word.count - 1
                gotIt = true
            } else if letters[0] != letters[1] {
                gotIt = true
            } else {
                letters.removeAll()
            }
        }
        return letters
    }

    // Create a timer that calls the "updateTimer" in every 0.7 seconds
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: time, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }

    //This function is called every 0.7 seconds to make the changes due to the words in the text.
    @objc func updateTimer() {
        seconds += 1

        wwdcLabel.text = changeLetters(word: "WWDC")
        lbl2019.text = changeLetters(word: "2019")
        scholarshipLabel.text = changeLetters(word: "Scholarship")
        submissionLabel.text = changeLetters(word: "submission")

        var i: Int = 0

        for i in i..<words.count {
            if seconds%2 == 0 {
                words[i] = changeLetters(word: words[i])
            } else if seconds%3 == 0 {
                words[i] = String(words[i].reversed())
            } else {
                words[i] = wordsCopy[i]
            }
        }
        setNewWords()
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = DyslexiaViewController()
//PlaygroundPage.current.assessmentStatus = PlaygroundPage.AssessmentStatus.fail(hints: ["You can answer the question by typing something in the variable 'text'. 🤔"], solution: nil)
//#-end-hidden-code
