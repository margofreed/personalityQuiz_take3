//
//  ViewController.swift
//  personalityQuiz_take2
//
//  Created by Freed, Margo on 7/17/20.
//  Copyright © 2020 margofreed. All rights reserved.
//

import UIKit

class IntroductionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func beginQuizPressed(_ sender: Any) {
        performSegue(withIdentifier: "beginQuiz", sender: nil)
    }
    
    @IBAction func unwindToIntroductionViewController(segue: UIStoryboardSegue) {}
}

