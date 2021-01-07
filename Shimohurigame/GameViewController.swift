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
    
    var timer: Timer?
    var counter = 2
    
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

    var array = ["冠","婚","葬","祭"]
    
    func question(){
        let first = array.randomElement()
        let second = array.randomElement()
        let third = array.randomElement()
        
        FirstLabel.text = first
        SecondLabel.text = second
        ThirdLabel.text = third
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTimer()
        
    }
    
    @IBAction func YeahButton(_ sender: Any) {
        yeahSoundPlayer.currentTime = 0
        yeahSoundPlayer.play()
        myAnswer.text = "イェイ"
    }
    
    @IBAction func WooButton(_ sender: Any) {
        wooSoundPlayer.currentTime = 0
        wooSoundPlayer.play()
        myAnswer.text = "ウー"
    }
    
    @IBAction func WasshoiButton(_ sender: Any) {
        wassyoiSoundPlayer.currentTime = 0
        wassyoiSoundPlayer.play()
        myAnswer.text = "わっしょい"
    }
    
    @IBAction func StopButton(_ sender: Any) {
        effectSoundPlayer.currentTime = 0
        effectSoundPlayer.play()
    }
    
    //1秒毎に呼び出される
    @objc func startTimer(){
        while counter > 0 {
            counter -= 1
            TimerLabel.text = String(counter)
        }
    }
    
    //画面が切り替わるときに
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        //タイマーを停止
        if let workingTimer = timer{
            workingTimer.invalidate()
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
