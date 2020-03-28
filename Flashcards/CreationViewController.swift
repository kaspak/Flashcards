//
//  CreationViewController.swift
//  Flashcards
//
//  Created by Kassy Pak on 3/7/20.
//  Copyright © 2020 Kassy Pak. All rights reserved.
//

import UIKit

class CreationViewController: UIViewController {
    
    @IBOutlet weak var question: UITextField!
    @IBOutlet weak var answer: UITextField!
    var initialQuestion: String?
    var initialAnswer: String?
    
    @IBOutlet weak var answerOne: UITextField!
    @IBOutlet weak var answerTwo: UITextField!
    @IBOutlet weak var answerThree: UITextField!
    
    var flashcardsController: ViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        question.text = initialQuestion
        answer.text = initialAnswer
    }
    
    /* When user taps on "Cancel", func dismisses the Creation View Controller
     * (User inputs for Q&A and optional answers) */
    @IBAction func didTapOnCancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    /* When user taps on "Done", func initalizes question and answer value and
     * Sends an error alert if checked values are empty/nil.
     * If not, func updates new flashcard with user inputted values. */
    @IBAction func didTapOnDone(_ sender: Any) {
        let questionText = question.text
        let answerText = answer.text
        
        if ( (questionText ?? "").isEmpty || (answerText ?? "").isEmpty ) {
            let alert = UIAlertController(title: "Missing text", message: "You need to enter both a question and an answer.", preferredStyle: UIAlertController.Style.alert)
            
            let okAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(okAction)
            
            present(alert, animated: true)
        }
        else {
            flashcardsController.updateFlashcard(question: questionText!, answer: answerText!)
            dismiss(animated: true)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
