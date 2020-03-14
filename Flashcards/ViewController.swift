//
//  ViewController.swift
//  Flashcards
//
//  Created by Kassy Pak on 2/15/20.
//  Copyright © 2020 Kassy Pak. All rights reserved.
//

import UIKit

struct Flashcard {
    var question: String
    var answer: String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var Card: UIView!
    
    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    
    @IBOutlet weak var op1: UIButton!
    @IBOutlet weak var op2: UIButton!
    @IBOutlet weak var op3: UIButton!
    
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    // Array to hold our flashcards
    var flashcards = [Flashcard]()
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Card.layer.cornerRadius = 20.0
        Card.layer.shadowRadius = 15.0
        Card.layer.shadowOpacity = 0.2
        Card.clipsToBounds = true
        
        op1.layer.borderWidth = 3.0
        op1.layer.cornerRadius = 20.0
        op1.layer.borderColor = #colorLiteral(red: 0.003117383691, green: 0.5182323456, blue: 0.98661834, alpha: 1)
        
        op2.layer.borderWidth = 3.0
        op2.layer.cornerRadius = 20.0
        op2.layer.borderColor = #colorLiteral(red: 0.003117383691, green: 0.5182323456, blue: 0.98661834, alpha: 1)
        
        op3.layer.borderWidth = 3.0
        op3.layer.cornerRadius = 20.0
        op3.layer.borderColor = #colorLiteral(red: 0.003117383691, green: 0.5182323456, blue: 0.98661834, alpha: 1)
        
        readSavedFlashcards()
        
        //Adding initial flashcard if needed
        if flashcards.count == 0 {
            updateFlashcard(question: "What year was the war of 1812", answer: "1812")
        }
        else {
            updateLabels()
            updateNextPrevButtons()
        }
    }
    
    @IBAction func didTapOp1(_ sender: Any) {
        op1.isHidden = true
    }
    
    @IBAction func didTapOp2(_ sender: Any) {
        op1.isHidden = true
        op3.isHidden = true
        frontLabel.isHidden = true
    }
    
    @IBAction func didTapOp3(_ sender: Any) {
        op3.isHidden = true
    }
    
    @IBAction func didTapOnFrontCard(_ sender: UILabel) {
        print("Working")
        if(frontLabel.isHidden == true) {
            frontLabel.isHidden = false
            op1.isHidden = false
            op3.isHidden = false
        }
        else {
            op1.isHidden = true
            op3.isHidden = true
            frontLabel.isHidden = true
        }
    }
    
    func updateFlashcard(question: String, answer: String) {
        let flashcard = Flashcard(question: question, answer: answer)
        flashcards.append(flashcard)
        
        print("Added new flashcard")
        print("We now have \(flashcards.count) flashcards")
        currentIndex = flashcards.count - 1
        print("Our current index is \(currentIndex)")
        updateNextPrevButtons()
        updateLabels()
        saveAllFlashcardsToDisk()
    }
    
    
    @IBAction func didTapOnPrev(_ sender: Any) {
        if (currentIndex > 0) {
            currentIndex = currentIndex - 1
            updateLabels()
            updateNextPrevButtons()
        }
    }
    
    @IBAction func didTapOnNext(_ sender: Any) {
        currentIndex = currentIndex + 1
        updateLabels()
        updateNextPrevButtons()
    }
    
    func updateLabels() {
        // Get current labels
        let currentFlashcard = flashcards[currentIndex]
        
        // Update labels
        frontLabel.text = currentFlashcard.question
        backLabel.text = currentFlashcard.answer
    }
    
    func updateNextPrevButtons() {
        nextButton.isEnabled = true
        prevButton.isEnabled = true
        
        if (currentIndex == 0) {
            prevButton.isEnabled = false
            print("working 0")
        }
        
        if (currentIndex == flashcards.count - 1) {
            nextButton.isEnabled = false
            print("working 2")
        }
    }
    
    func saveAllFlashcardsToDisk() {
        // From flashcard array to dictionary array
        let dictArray = flashcards.map { (card) -> [String: String] in
            return ["question": card.question, "answer": card.answer]
        }
        UserDefaults.standard.set(dictArray, forKey: "flashcards")
        print("Flashcards Saved to UserDefaults !")
    }
    
    func readSavedFlashcards() {
        // Read dictionary array from disk (if any)
       if let dictArray = UserDefaults.standard.array(forKey: "flashcards") as? [[String: String]] {
        // Know for sure we have a dictionary Array
            let savedCards = dictArray.map { dictionary -> Flashcard in
                return Flashcard(question: dictionary["question"]!, answer: dictionary["answer"]!)
            }
        // Put all cards in our flashcards array
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
