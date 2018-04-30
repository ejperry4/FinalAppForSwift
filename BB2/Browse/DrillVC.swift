//
//  DrillVC.swift
//  BB2
//
//  Created by Ej Perry on 4/29/18.
//  Copyright © 2018 Perry. All rights reserved.
//

import UIKit
import AVFoundation
class DrillVC: UIViewController {
    var drills: Drills!
    //var drillName: String?
    //var drillDescription: String?
    var time = 0.0
    var nextButtonPress = false
    var timer = Timer()
    var startTimer = -2
    var index = 0
    var audioPlayer = AVAudioPlayer()
    
    
    @IBOutlet weak var drillNameLabel: UILabel!
    @IBOutlet weak var gifView: UIImageView!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var drillDescriptionLabel: UILabel!
    
    @IBOutlet weak var pauseButtonImage: UIButton!
    
    @IBOutlet weak var playButtonImage: UIButton!
    
    @IBOutlet weak var previoudButtonImage: UIButton!
    
    @IBOutlet weak var nextButtonImage: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        drillNameLabel.text = drills.name
        drillDescriptionLabel.text = drills.description
        gifView.loadGif(name: drills.gif)
        time = drills.time * 100.0
        runTimer()
        updateTimer()
        pauseButtonImage.isHidden = false
        playButtonImage.isHidden = true
        previoudButtonImage.isHidden = true
        nextButtonImage.isHidden = true
        //print(drills)
    }
    

    @objc func updateTimer() {
        if time > -2 {
            time = time - 1
            let minutes = Int(time) / 60
            let seconds = Int(time) % 60
            if seconds < 10 {
                timerLabel.text = "\(minutes):0\(seconds + 2)"
            } else {
                timerLabel.text = "\(minutes):\(seconds + 2)"

            }
        } else if time == -2 {
            playSound(soundName: "timerSound", audioPlayer: &audioPlayer)
            stopTimer()
            playButtonImage.isHidden = true
            pauseButtonImage.isHidden = true
        }

    }
    //if time == -2 {
    
    //}
    @IBAction func pauseButtonPressed(_ sender: UIButton) {
        stopTimer()
        pauseButtonImage.isHidden = true
        playButtonImage.isHidden = false
        //if audioPlayer.isPlaying == true {
            //audioPlayer.stop()
        //}
    }
    @IBAction func playButtonPressed(_ sender: UIButton) {
        runTimer()
        playButtonImage.isHidden = true
        pauseButtonImage.isHidden = false
       
        
    }
    @IBAction func previousButtonPressed(_ sender: UIButton) {
        
    }
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        //nextButtonPress = true
        
    }
    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
        audioPlayer.stop()
    }
    
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if nextButtonPress == true {
            if segue.identifier == "NextToRandom" {
                let destination = segue.destination as! RandomWorkoutVC
                destination.nextClicked = true
            }
        }
    }*/
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(DrillVC.updateTimer)), userInfo: nil, repeats: true)
        updateTimer()
    }
    func stopTimer() {
        timer.invalidate()
    }
    func playSound(soundName: String, audioPlayer: inout AVAudioPlayer) {
        if let sound = NSDataAsset(name: soundName) {
            //Check if sound.data is a sound file
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                print("ERROR: Sound in sound\(soundName) could not be played as audio" )
            }
        }else {
            // Error File Didn't Load
            print("Error file sound\(soundName) didn't load" )
        }
    }
}
