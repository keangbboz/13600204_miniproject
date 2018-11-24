//
//  ViewController.swift
//  miniproject
//
//  Created by ict on 16/11/2561 BE.
//  Copyright © 2561 ictnajaa. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var ShowQuestion: UILabel!
    
    @IBOutlet weak var ProgressBar: UIView!
    @IBOutlet weak var wrongAnsLabel: UILabel!
    @IBOutlet weak var crrectAnsLabel: UILabel!
    @IBOutlet weak var ShowScore: UILabel!
    @IBOutlet weak var ShowTimer: UILabel!
    var audioPlayer : AVAudioPlayer!
    let soundFilesName = ["OHNO","WOW0",]
    let allQuestion = QuestionBank()
    var pickedAnswer : Bool = true
    var questionNumber : Int = 0
    var score : Int = 0
    var scoreTure : Int = 0
    var scoreFalse : Int = 0
    var timer = Timer()
    var timeCount  = 10
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @objc func processTime() {
        //Local scope
        //อยู่ในฟังก์ชั่น เรียกใช้ได้เฉพาะในฟังก์ชั่นเท่านั้น
        if timeCount > 0{
            timeCount -= 1
        print(timeCount)
        ShowTimer.text = "เวลา : "+String(timeCount)
           
        //showtimer.text = String(timeCount) Casting
        }
        
        else if (timeCount == 0){
            ProgressHUD.showError("หมดเวลา")
            timer.invalidate()
            
            startOver()
            
        }
        
        

       
    
}
    @IBAction func play(_ sender: Any) {
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.processTime), userInfo: nil, repeats: true)
        processTime()
        
        
    }
    
    @IBAction func Ansbutton(_ sender: UIButton) {
        if timeCount < 10 && timeCount > 0 {
        if sender.tag == 1{
            print("picked true")
            //ให้ค่ากับตัวแปรที่เก็บคำตอบ
            pickedAnswer = true
        }else if sender.tag == 2{
            print("picked false")
            pickedAnswer = false
        }
        checkAnswer()
        questionNumber = questionNumber+1
        updateUI()
        }
    }
    
    func startOver() {
        questionNumber = 0
        score = 0
        timeCount  = 10
        scoreTure = 0
        scoreFalse = 0
        updateUI()
    }//end startOver
    
    func checkAnswer(){
        let correctAnswer = allQuestion.list[questionNumber].answer
        
        
        if correctAnswer == pickedAnswer{
            print("ขอบคุณครับ")
            score = score + 1
            scoreTure = scoreTure + 1
            ProgressHUD.showSuccess("ถูกครับ")
//            playSound("WOW0")
        }else{
            print("ผมเสียใจ")
            score = score + 1
            scoreFalse = scoreFalse + 1
            ProgressHUD.showError("ผิดครับ")
//            playSound("OHNO")
            nextQuestion()
            
        }
    }//end checkAnswer
    func nextQuestion() {
        
        if questionNumber <= 4 {
            ShowQuestion.text = allQuestion.list[questionNumber].questionText
        }else{
            print("end of question")
            let alert = UIAlertController(title: "WOW", message: "ถ้าให้ A คะแนนของคุณคือ \(scoreTure)", preferredStyle: .alert)
            let  restartAction = UIAlertAction(title: "Restart", style: .default, handler: {UIAlertAction in self.startOver()})
            
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
        
    }

    func updateUI() {
        
        ProgressBar.frame.size.width = (view.frame.size.width / 5) * CGFloat(questionNumber)
        ShowScore.text = "score: " + String(score)
        
        nextQuestion()
        
    }
    func playSound(_ playThis: String){
        let soundURL = Bundle.main.url(forResource: playThis, withExtension: "WAV")
        audioPlayer = try! AVAudioPlayer(contentsOf: soundURL!)
        audioPlayer.play()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
       nextQuestion()
    }
   
}
