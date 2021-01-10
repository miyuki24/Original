//
//  HomeViewController.swift
//  Shimohurigame
//
//  Created by 田中美幸 on 2020/12/28.
//  Copyright © 2020 miyuki.tanaka2. All rights reserved.
//

import UIKit
import AVFoundation

class HomeViewController: UIViewController {
    
    @IBOutlet weak var HighScoreLabel: UILabel!
    
    let openingSoundPlayer = try! AVAudioPlayer(data: NSDataAsset(name: "Opening")!.data)
    let effectSoundPlayer = try! AVAudioPlayer(data: NSDataAsset(name: "effect")!.data)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        openingSoundPlayer.currentTime = 0
        openingSoundPlayer.play()
        
    }
    
    @IBAction func StartButton(_ sender: Any) {
        effectSoundPlayer.currentTime = 0
        effectSoundPlayer.play()
        openingSoundPlayer.stop()
    }
    
    @IBAction func TitleButton(_ sender: Any) {
        openingSoundPlayer.currentTime = 0
        openingSoundPlayer.play()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let highScore = UserDefaults.standard.integer(forKey: "HIGH")
        HighScoreLabel.text = "ハイスコア:\(highScore)点"
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
