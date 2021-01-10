//
//  GameViewController.swift
//  Shimohurigame
//
//  Created by 田中美幸 on 2020/12/28.
//  Copyright © 2020 miyuki.tanaka2. All rights reserved.
//

import UIKit
import AVFoundation

class GameViewController: UIViewController {

    
    @IBOutlet weak var FirstLabel: UILabel!
    @IBOutlet weak var SecondLabel: UILabel!
    @IBOutlet weak var ThirdLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var TimerLabel: UILabel!
    @IBOutlet weak var myAnswer: UILabel!
    
    //サウンドファイルを読み込んでプレイヤーを作る
    let yeahSoundPlayer = try! AVAudioPlayer(data: NSDataAsset(name: "yeah")!.data)
    let wooSoundPlayer = try! AVAudioPlayer(data: NSDataAsset(name: "woo")!.data)
    let wassyoiSoundPlayer = try! AVAudioPlayer(data: NSDataAsset(name: "wassyoi")!.data)
    let effectSoundPlayer = try! AVAudioPlayer(data: NSDataAsset(name: "effect")!.data)
    
    //冠婚葬祭
    let kanSoundPlayer = try! AVAudioPlayer(data: NSDataAsset(name: "kan")!.data)
    let konSoundPlayer = try! AVAudioPlayer(data: NSDataAsset(name: "kon")!.data)
    let souSoundPlayer = try! AVAudioPlayer(data: NSDataAsset(name: "sou")!.data)
    let saiSoundPlayer = try! AVAudioPlayer(data: NSDataAsset(name: "sai")!.data)
    
    var timer: Timer?
    var counter = 5
    var finishTimer: Timer?
    var finishCounter = 5
    var score = 0
    let userDefaults:UserDefaults = UserDefaults.standard
    var answerCount = 0
    
    //ゲームデータ
    enum GameData {
        case kan
        case kon
        case sou
        case sai
        var question: String {
            switch self {
            case .kan: return "冠"
            case .kon: return "婚"
            case .sou: return "葬"
            case .sai: return "祭"
            }
        }
        var answer: String {
            switch self {
            case .kan: return "イェイ"
            case .kon: return "イェイ"
            case .sou: return "ウー"
            case .sai: return "わっしょい"
            }
        }
    }
    var array: [GameData] = [.kan, .kon, .sou, .sai]
    
    
    //タイマー作成
    func createTimer(){
        if timer == nil {
            timer = Timer.scheduledTimer(
                timeInterval: TimeInterval(1.0),
                target: self,
                selector: #selector(GameViewController.startTimer),
                userInfo: nil,
                repeats: true)
        }
    }
    
    var first: GameData!
    var second: GameData!
    var third: GameData!
    
    func question() {
        first = array.randomElement()
        second = array.randomElement()
        third = array.randomElement()
        
        FirstLabel.text = first?.question
        SecondLabel.text = second?.question
        ThirdLabel.text = third?.question
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    @IBAction func YeahButton(_ sender: Any) {
        yeahSoundPlayer.currentTime = 0
        yeahSoundPlayer.play()
        myAnswer.text = "イェイ"
        
        answerCount += 1
        //myAnswerはイェイ
        check(myAnswer: myAnswer.text!)
    }
    
    @IBAction func WooButton(_ sender: Any) {
        wooSoundPlayer.currentTime = 0
        wooSoundPlayer.play()
        myAnswer.text = "ウー"
        
        answerCount += 1
        check(myAnswer: myAnswer.text!)
    }
    
    @IBAction func WasshoiButton(_ sender: Any) {
        wassyoiSoundPlayer.currentTime = 0
        wassyoiSoundPlayer.play()
        myAnswer.text = "わっしょい"
        
        answerCount += 1
        check(myAnswer: myAnswer.text!)
    }
    
    @IBAction func StopButton(_ sender: Any) {
        effectSoundPlayer.currentTime = 0
        effectSoundPlayer.play()
    }
    
    func check(myAnswer: String) {
        if answerCount == 1 {
            
            if myAnswer == first.answer {
                score += 1
                print("1問正解")
                scoreLabel.text = "\(score)"
            }
        } else if answerCount == 2 {
            if myAnswer == second.answer {
                score += 1
                print("2問正解")
                scoreLabel.text = "\(score)"
            }
        } else if answerCount == 3 {
            if myAnswer == third.answer {
                score += 1
                print("3問正解")
                scoreLabel.text = "\(score)"
            }
        } else if answerCount == 4 {
            answerCount = 1
            print("4問以上")
            return
        }
    }
    
    //1秒毎に呼び出される
    @objc func startTimer(){
        if counter > 0 {
            counter -= 1
            TimerLabel.text = "\(counter)"
        } else if counter == 0 {
            createScore()
        }
    }
    
    func createScore() {
        //ハイスコアかどうか確認する
        var highScore = userDefaults.integer(forKey: "HIGH")
        if score > highScore {
            highScore = score
            userDefaults.set(highScore, forKey: "HIGH")
            userDefaults.synchronize()
            let finalViewController = self.storyboard?.instantiateViewController(withIdentifier: "final") as! FinalViewController
            finalViewController.HighScore = highScore
            let homeViewController = self.presentingViewController as! HomeViewController
            homeViewController.HighScore = highScore
            self.present(finalViewController, animated: true, completion: nil)
        } else {
            let notupdateViewController = self.storyboard?.instantiateViewController(withIdentifier: "notupdate") as! NotupdateViewController
            notupdateViewController.Score = score
            self.present(notupdateViewController, animated: true, completion: nil)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        createTimer()
        question()
    }
    
    //画面が切り替わるときに
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        //タイマーを停止
        if let workingTimer = timer{
            workingTimer.invalidate()
            timer = nil
        }
        
        if let workingFinishTimer = finishTimer {
            workingFinishTimer.invalidate()
            finishTimer = nil
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    

}
