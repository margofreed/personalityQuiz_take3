//
//  QuestionViewController.swift
//  personalityQuiz_take2
//
//  Created by Freed, Margo on 7/17/20.
//  Copyright © 2020 margofreed. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var singleButton1: UIButton!
    @IBOutlet weak var singleButton2: UIButton!
    @IBOutlet weak var singleButton3: UIButton!
    @IBOutlet weak var singleButton4: UIButton!

    @IBOutlet weak var rangedSlider: UISlider!
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet weak var rangedLabel1: UILabel!
    @IBOutlet weak var rangedLabel2: UILabel!
    
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var multiLabel1: UILabel!
    @IBOutlet weak var multiLabel2: UILabel!
    @IBOutlet weak var multiLabel3: UILabel!
    @IBOutlet weak var multiLabel4: UILabel!
    
    @IBOutlet weak var multSwitch1: UISwitch!
    @IBOutlet weak var multSwitch2: UISwitch!
    @IBOutlet weak var multSwitch3: UISwitch!
    @IBOutlet weak var multSwitch4: UISwitch!

    @IBOutlet weak var progressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }
    
    //Properties
    var questionIndex = 0
    
    //Initialize a collection that stores the player's answers
    var chosenAnswers: [Answer] = []
    
    var questions: [Question] = [
        
        Question (text: "1. When you have a crush, how do you handle it?",
                  type:.single,
                  answers: [
                    Answer(text: "Ignore it and hope the feeling passes.", type: .kawasemi),
                    Answer(text: "Tell them straight up!", type: .steel),
                    Answer(text: "Tell your friends, but not them.", type: .regina),
                    Answer(text: "Don't tell anyone but hope they notice you.", type: .thunder)
                        ]),
        Question (text: "2. Weapon of choice?(choose two)",
                  type: .multiple,
                  answers: [
                    Answer(text: "Katana", type: .regina),
                    Answer(text: "Spear", type: .thunder),
                    Answer(text: "Dual Blades", type: .steel),
                    Answer(text: "War Fans", type: .kawasemi),
                    ]),
        Question (text: "3. Which of the following would you consider your biggest weakness?",
                  type: .single,
                  answers: [
                    Answer(text: "Selfishness", type: .steel),
                    Answer(text: "Ignorance", type: .regina),
                    Answer(text: "Insecurity", type: .thunder),
                    Answer(text: "Stubborness", type: .kawasemi)
                    ]),
        Question (text: "4. Pick an aesthetic!~",
                  type: .single,
                  answers: [
                    Answer(text: "Minimalist", type: .thunder),
                    Answer(text: "Boho", type: .kawasemi),
                    Answer(text: "Lace", type: .regina),
                    Answer(text: "Oriental", type: .steel)
                    ]),
        Question (text: "5. An ideal vacation spot would be:",
                  type: .single,
                  answers:  [
                    Answer(text: "Cabin in the woods.", type: .kawasemi),
                    Answer(text: "Sitting at the beach.", type: .regina),
                    Answer(text: "Wandering around the city.", type: .steel),
                    Answer(text: "Hiking in the mountains.", type: .thunder)
                    ]),
        Question (text: "6. Favorite Activities (choose two)",
                  type: .multiple,
                  answers: [
                    Answer(text: "Drawing", type: .regina),
                    Answer(text: "Cooking", type: .steel),
                    Answer(text: "Writing", type: .kawasemi),
                    Answer(text: "Dancing", type: .thunder),
        ]),
        Question (text: "7. In your friend group, what word describes you the most?",
                  type: .single,
                  answers: [
                    Answer(text: "Funny", type: .steel),
                    Answer(text: "Thoughtful", type: .kawasemi),
                    Answer(text: "Caring", type: .thunder),
                    Answer(text: "Smart", type: .regina)
                    ]),
        Question(text: "8. What district of Tokyo would you visit first?",
                 type: .single,
                 answers: [
                    Answer(text: "Shinjuku - bright lights, big city.", type: .thunder),
                    Answer(text: "Asakusa - traditional heritage.", type: .kawasemi),
                    Answer(text: "Akihabara - arcades, otaku culture.", type: .steel),
                    Answer(text: "Harajuku - fashion, shopping.", type: .regina)
        ]),
        Question (text: "9. What do you value most?",
                  type: .single,
                  answers: [
                    Answer(text: "Peace", type: .kawasemi),
                    Answer(text: "Happiness", type: .steel),
                    Answer(text: "Love", type: .thunder),
                    Answer(text: "Wisdom", type: .regina)
        ]),
        
        Question (text: "10. How much do you enjoy high speed travel(plane, bullet train, etc)?", type: .ranged, answers: [
            Answer(text: "Too fast.", type: .kawasemi),
            Answer(text: "", type: .regina),
            Answer(text: "", type: .thunder),
            Answer(text: "Umm, yes please!", type: .steel)
        ])
      
    ]
    
    func updateUI() {
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        navigationItem.title = "Question #\(questionIndex + 1)"
        questionLabel.text = currentQuestion.text
        progressView.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.type {
        case .single:
            updateSingleStack(using: currentAnswers)
        case.multiple:
            updateMultipleStack(using: currentAnswers)
        case.ranged:
            updateRangedStack(using: currentAnswers)

        }
    }
    
    func updateSingleStack(using answers: [Answer]) {
        singleStackView.isHidden = false
        singleButton1.setTitle(answers[0].text, for: .normal)
        singleButton2.setTitle(answers[1].text, for: .normal)
        singleButton3.setTitle(answers[2].text, for: .normal)
        singleButton4.setTitle(answers[3].text, for: .normal)
    }
    
    func updateMultipleStack(using answers: [Answer]) {
        multipleStackView.isHidden = false
        multSwitch1.isOn = false
        multSwitch2.isOn = false
        multSwitch3.isOn = false
        multSwitch4.isOn = false
        multiLabel1.text = answers[0].text
        multiLabel2.text = answers[1].text
        multiLabel3.text = answers[2].text
        multiLabel4.text = answers[3].text
    }
    
    func updateRangedStack(using answers: [Answer]) {
        rangedStackView.isHidden = false
        rangedSlider.setValue(0.5, animated: false)
        rangedLabel1.text = answers.first?.text
        rangedLabel2.text = answers.last?.text
    }
    
    //IBAction for single answer button pressed
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        
        switch sender {
        case singleButton1:
            chosenAnswers.append(currentAnswers[0])
        case singleButton2:
            chosenAnswers.append(currentAnswers[1])
        case singleButton3:
            chosenAnswers.append(currentAnswers[2])
        case singleButton4:
            chosenAnswers.append(currentAnswers[3])
        default:
            break
        }
        nextQuesstion()
    }
    
    //IBAction for multiple answer button pressed
    @IBAction func multipleAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        
        if multSwitch1.isOn {
            chosenAnswers.append(currentAnswers[0])
        }
        if multSwitch2.isOn {
            chosenAnswers.append(currentAnswers[1])
        }
        if multSwitch3.isOn {
            chosenAnswers.append(currentAnswers[2])
        }
        if multSwitch4.isOn {
            chosenAnswers.append(currentAnswers[3])
        }
        nextQuesstion()
    }
    
    @IBAction func rangedAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        chosenAnswers.append(currentAnswers[index])
        nextQuesstion()
    }
    
    //Function for the next question
    func nextQuesstion() {
        questionIndex += 1
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "ResultsSegue", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultsSegue" {
            let resultsViewController = segue.destination as! ResultsViewController
            resultsViewController.responses = chosenAnswers
        }
    }
    
}
