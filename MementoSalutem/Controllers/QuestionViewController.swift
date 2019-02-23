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
     
     */
    public var questionView: QuestionView! {
        guard isViewLoaded else {return nil}
        return (view as! QuestionView)
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
}

