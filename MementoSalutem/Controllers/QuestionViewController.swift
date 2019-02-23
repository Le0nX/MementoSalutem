//
//  ViewController.swift
//  MementoSalutem
//
//  Created by Denis Nefedov on 22/02/2019.
//  Copyright © 2019 X. All rights reserved.
//

import UIKit

public class QuestionViewController: UIViewController {

    public var questionGroup = QuestionGroup.basicPhrases()
    public var questionIndex = 0
    
    public var correctCount = 0
    public var incorrectCount = 0
    
    /**
     # Описание:
     Выставляем проверку на доуступ к вьюхе. Если кто-то по неосторожности
     попытается к ней обратиться до ее загрузки, то получит nil
     */
    public var questionView: QuestionView! {
        guard isViewLoaded else {return nil}
        return (view as! QuestionView)
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        showQuestion()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func toggleAnswerLabels(_ sender: Any) {
        questionView.answerLbl.isHidden = !questionView.answerLbl.isHidden
        questionView.hintLbl.isHidden = !questionView.hintLbl.isHidden
    }
    
    private func showQuestion() {
        let question = questionGroup.questions[questionIndex]
        
        questionView.answerLbl.text = question.answer
        questionView.promtLbl.text = question.prompt
        questionView.hintLbl.text = question.hint
        
        questionView.answerLbl.isHidden = true
        questionView.hintLbl.isHidden = true
    }
    
    @IBAction func handleIncorrect(_ sender: UIButton) {
        incorrectCount += 1
        questionView.incorrecCountLbl.text = "\(incorrectCount)"
        showNextQuestion()
    }
    
    @IBAction func handleCorrect(_ sender: UIButton) {
        correctCount += 1
        questionView.correctCountLbl.text = "\(correctCount)"
        showNextQuestion()
    }
    
    private func showNextQuestion() {
        questionIndex += 1
        guard questionIndex < questionGroup.questions.count else {
            // handle
            return
        }
        showQuestion()
    }
}

