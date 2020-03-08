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
    @IBOutlet weak var answerOne: UITextField!
    @IBOutlet weak var answerTwo: UITextField!
    @IBOutlet weak var answerThree: UITextField!
    
    var flashcardsController: ViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapOnCancel(_ sender: Any) {
        dismiss(animated: true)
    }
    @IBAction func didTapOnDone(_ sender: Any) {
        // get the text in question text field
        let questionText = question.text
        let answerText = answer.text
        
        flashcardsController.updateFlashcard(question: questionText!, answer: answerText!)
        
        dismiss(animated: true)
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
