//
//  NotupdateViewController.swift
//  Shimohurigame
//
//  Created by 田中美幸 on 2020/12/28.
//  Copyright © 2020 miyuki.tanaka2. All rights reserved.
//

import UIKit
import AVFoundation

class NotupdateViewController: UIViewController {

    @IBOutlet weak var ScoreLabel: UILabel!
    
    let score = UserDefaults.standard.integer(forKey: "SCORE")
    
    let effectSoundPlayer = try! AVAudioPlayer(data: NSDataAsset(name: "effect")!.data)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ScoreLabel.text = "\(score)点"
    }

    @IBAction func RetryButton(_ sender: Any) {
        effectSoundPlayer.currentTime = 0
        effectSoundPlayer.play()
        let gameViewController = self.storyboard?.instantiateViewController(withIdentifier: "game") as! GameViewController
        gameViewController.counter = 6
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func BackHomeButton(_ sender: Any) {
        effectSoundPlayer.currentTime = 0
        effectSoundPlayer.play()
        navigationController?.popToViewController(navigationController!.viewControllers[0], animated: true)
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
