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
        FrontLabel.isHidden = !FrontLabel.isHidden
    }
    
    func updateFlashcard(question: String, answer: String) {
        FrontLabel.text = question
        BackLabel.text = answer
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

