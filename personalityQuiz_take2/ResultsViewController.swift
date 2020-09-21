//
//  ResultsViewController.swift
//  personalityQuiz_take2
//
//  Created by Freed, Margo on 7/17/20.
//  Copyright © 2020 margofreed. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var resultLabell: UILabel!
    @IBOutlet weak var resultDefinition: UILabel!
    
    var responses: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResult()
        navigationItem.hidesBackButton = true
    }
    
    func calculatePersonalityResult() {
        var frequencyOfAnswers: [CharacterType: Int] = [:]
        let responseType = responses.map { $0.type }
    
        for response in responseType {
            frequencyOfAnswers[response] = (frequencyOfAnswers[response] ?? 0) + 1
        }
        
        let frequentAnswersSorted = frequencyOfAnswers.sorted { (pair1, pair2) -> Bool in
            return pair1.value > pair2.value
        }
        let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 > $1.1 }.first!.key
        
        resultLabell.text = "You are \(mostCommonAnswer.rawValue)"
        resultDefinition.text = mostCommonAnswer.definition
        
    }

}
