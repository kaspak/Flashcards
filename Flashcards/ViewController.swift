//
//  ViewController.swift
//  Flashcards
//
//  Created by Kassy Pak on 2/15/20.
//  Copyright © 2020 Kassy Pak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var Card: UIView!
    
    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    
    @IBOutlet weak var op1: UIButton!
    @IBOutlet weak var op2: UIButton!
    @IBOutlet weak var op3: UIButton!
    
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
        frontLabel.text = question
        backLabel.text = answer
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
