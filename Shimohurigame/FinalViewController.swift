//
//  FinalViewController.swift
//  Shimohurigame
//
//  Created by 田中美幸 on 2020/12/28.
//  Copyright © 2020 miyuki.tanaka2. All rights reserved.
//

import UIKit
import AVFoundation

class FinalViewController: UIViewController {

    var HighScore = 0
    
    @IBOutlet weak var ScoreLabel: UILabel!
    
    let effectSoundPlayer = try! AVAudioPlayer(data: NSDataAsset(name: "effect")!.data)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ScoreLabel.text = "\(HighScore)点"
    }
    
    @IBAction func RetryButton(_ sender: Any) {
        effectSoundPlayer.currentTime = 0
        effectSoundPlayer.play()
        let gameViewController = self.storyboard?.instantiateViewController(withIdentifier: "game") as! GameViewController
        self.present(gameViewController, animated: true, completion: nil)
    }
    
    @IBAction func BackHomeButton(_ sender: Any) {
        effectSoundPlayer.currentTime = 0
        effectSoundPlayer.play()
        let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: "home") as! HomeViewController
        self.present(homeViewController, animated: true, completion: nil)
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
