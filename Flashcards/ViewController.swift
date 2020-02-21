//
//  ViewController.swift
//  Flashcards
//
//  Created by Kassy Pak on 2/15/20.
//  Copyright © 2020 Kassy Pak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backLabel: UIButton!
    @IBOutlet weak var frontLabel: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func didTapOnFrontCard(_ sender: Any) {
        frontLabel.isHidden = true
    }
    
    @IBAction func didTapOnBackCard(_ sender: Any) {
        frontLabel.isHidden = false
    }
}
