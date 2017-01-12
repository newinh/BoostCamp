//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by 신승훈 on 2017. 1. 10..
//  Copyright © 2017년 BoostCamp. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    var recordedAudioURL: URL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!

    var printTimer: Timer!
    
    var remainTime : TimeInterval = 0.0
    
    enum ButtonType: Int{
        case slow = 0, fast, chipmunk, vader, echo, reverb
    }
    
    // MARK: Outlets
    
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    @IBOutlet weak var remainTimeLabel:UILabel!
    
    // Mark : Actions
    
    @IBAction func playSoundForButton(_ sender: UIButton){
        
        switch(ButtonType(rawValue: sender.tag)!){
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .chipmunk:
            playSound(pitch: 1000)
        case .vader:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }
        
        configureUI(.playing)
    }
    
    @IBAction func stopButtonPressed(_ sender: AnyObject){
        stopAudio()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
//        print(recordedAudioURL)

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        configureUI(.notPlaying)
    }
}
