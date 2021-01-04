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

    @IBOutlet weak var GameLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var TimerLabel: UILabel!
    
    //サウンドファイルを読み込んでプレイヤーを作る
    let yeahSoundPlayer = try! AVAudioPlayer(data: NSDataAsset(name: "yeah")!.data)
    let wooSoundPlayer = try! AVAudioPlayer(data: NSDataAsset(name: "woo")!.data)
    let wassyoiSoundPlayer = try! AVAudioPlayer(data: NSDataAsset(name: "wassyoi")!.data)
    let effectSoundPlayer = try! AVAudioPlayer(data: NSDataAsset(name: "effect")!.data)
    
    var timer: Timer!
    var count = 5
    
    //タイマー作成
    func createTimer(){
        let timer = Timer.scheduledTimer(timeInterval: 1.0,target: self,selector: #selector(self.startTimer),userInfo: nil,repeats: false)
        timer.fire()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func YeahButton(_ sender: Any) {
        yeahSoundPlayer.currentTime = 0
        yeahSoundPlayer.play()
    }
    
    @IBAction func WooButton(_ sender: Any) {
        wooSoundPlayer.currentTime = 0
        wooSoundPlayer.play()
    }
    
    @IBAction func WasshoiButton(_ sender: Any) {
        wassyoiSoundPlayer.currentTime = 0
        wassyoiSoundPlayer.play()
    }
    
    @IBAction func StopButton(_ sender: Any) {
        effectSoundPlayer.currentTime = 0
        effectSoundPlayer.play()
    }
    
    //1秒毎に呼び出される
    @objc func startTimer(){
        for count in 5...0{
            self.count -= 1
            TimerLabel.text = String(count)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //タイマーを停止する
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
