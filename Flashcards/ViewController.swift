//
//  ViewController.swift
//  Flashcards
//
//  Created by Akeeb Khandakar on 2/26/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var FrontLabel: UILabel!
    @IBOutlet weak var BackLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapOnFlashcard(_ sender: Any) {
        FrontLabel.isHidden = true
    }
    
}

