//
//  BreakViewController.swift
//  Shimohurigame
//
//  Created by 田中美幸 on 2020/12/28.
//  Copyright © 2020 miyuki.tanaka2. All rights reserved.
//

import UIKit
import AVFoundation

class BreakViewController: UIViewController {
    
    let effectSoundPlayer = try! AVAudioPlayer(data: NSDataAsset(name: "effect")!.data)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //再開ボタン
    @IBAction func RestartButton(_ sender: Any) {
        effectSoundPlayer.currentTime = 0
        effectSoundPlayer.play()
        navigationController?.popToViewController(navigationController!.viewControllers[1], animated: true)
    }
    
    //諦めるボタン
    @IBAction func GiveupButton(_ sender: Any) {
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

//BGMをつける
