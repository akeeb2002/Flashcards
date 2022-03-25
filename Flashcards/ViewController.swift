//
//  ViewController.swift
//  Flashcards
//
//  Created by Akeeb Khandakar on 2/26/22.
//

import UIKit


struct Flashcard {
    var question: String
    var answer: String
}


class ViewController: UIViewController {

    @IBOutlet weak var FrontLabel: UILabel!
    @IBOutlet weak var BackLabel: UILabel!
    
    
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var flashcards = [Flashcard]()
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        readSavedFlashcards()
        
        if flashcards.count == 0 {
            updateFlashcard(question: "Where are you from?" , answer: "France" )
                } else {
                    updateLabels()
                    updateNextPrevButtons()
                }
    }

    @IBAction func didTapOnFlashcard(_ sender: Any) {
        FrontLabel.isHidden = !FrontLabel.isHidden
    }
    
    func updateFlashcard(question: String, answer: String) {
        let flashcard = Flashcard(question: question, answer: answer)
        flashcards.append(flashcard)
        
        // Logging on the console
        print("Added new flashcard!")
        print("We now have \(flashcards.count) flashcards")
        
        currentIndex = flashcards.count - 1
        print("Our current index is \(currentIndex)")
        
        updateNextPrevButtons()
        updateLabels()
        saveAllFlashcardsToDisk()
            }
    
    @IBAction func didTapOnPrev(_ sender: Any) {
        currentIndex = currentIndex - 1
        updateLabels()
        updateNextPrevButtons()
    }
    
    @IBAction func didTapOnNext(_ sender: Any) {
        currentIndex = currentIndex + 1
        updateLabels()
        updateNextPrevButtons()
    }
    
    
    func updateLabels() {
        let currentFlashcard = flashcards[currentIndex]
        
        FrontLabel.text = currentFlashcard.question
        BackLabel.text = currentFlashcard.answer
    }
    
    
    func updateNextPrevButtons(){
        if (currentIndex == flashcards.count - 1) {
            nextButton.isEnabled = false
        } else {
            nextButton.isEnabled = true
        }
        
        if currentIndex == 0 {
            prevButton.isEnabled = false
        } else {
            prevButton.isEnabled = true
        }
    }
    
    
    func saveAllFlashcardsToDisk(){
        let dictionaryArray = flashcards.map { (card) -> [String: String] in return ["question": card.question, "answer": card.answer]}
        
        UserDefaults.standard.set(dictionaryArray, forKey: "flashcards")
        
        print("Flashcards saved to UserDefaults")
    }
    
    func readSavedFlashcards() {
        if let dictionaryArray = UserDefaults.standard.array(forKey: "flashcards") as? [[String: String]]{
            
            let savedCards = dictionaryArray.map { dictionary -> Flashcard in return Flashcard(question: dictionary["question"]!, answer: dictionary["answer"]!)}
            flashcards.append(contentsOf: savedCards)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // We know the destination of segue is the Navigation Controller
            let navigationController = segue.destination as! UINavigationController

            // We know the Navigation Controller only contains a Creation View Controller
            let creationController = navigationController.topViewController as! CreationViewController

            // We set the flashcardsController prop to self
            creationController.flashcardsController = self
        }
    
}

