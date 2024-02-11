//
//  ViewController.swift
//  QuizApp
//
//  Created by Lingfang He on 2024-02-09.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreLable: UILabel!
    
    @IBOutlet weak var questionLable: UILabel!
    
    @IBOutlet weak var progress: UIProgressView!
    
    @IBOutlet weak var trueButton: UIButton!
    
    @IBOutlet weak var falseButton: UIButton!
    
    var quiz: Quiz = Quiz()
    var timer: Timer = Timer()
    
    
    //var question Question = Question()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        trueButton.layer.cornerRadius = 25
        trueButton.layer.borderWidth = 2
        trueButton.layer.borderColor = UIColor.gray.cgColor
        
        falseButton.layer.cornerRadius = 25
        falseButton.layer.borderWidth = 2
        falseButton.layer.borderColor = UIColor.gray.cgColor
        
        updateUI()
    }


    @IBAction func buttonPressed(_ sender: UIButton) {
        //print(sender.currentTitle!)
        // one method 2 button
        print(sender.currentTitle!)
        timer.invalidate()
        if quiz.checkAnswer(userAnswer: sender.currentTitle!){
            // change the color of the btn
            sender.backgroundColor = UIColor.green
            
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        quiz.nextQUestion()
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false){
            (_) in
            self.updateUI()
        }
    
    }
    
    func updateUI(){
        questionLable.text = quiz.getQuestionText()
        scoreLable.text = "Score : \(quiz.getScore())"
        progress.progress = quiz.changeProgress()
        
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        
    }
    
}
