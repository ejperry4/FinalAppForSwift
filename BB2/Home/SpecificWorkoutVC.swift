//
//  SpecificWorkoutVC.swift
//  BB2
//
//  Created by Ej Perry on 4/30/18.
//  Copyright © 2018 Perry. All rights reserved.
//

import UIKit

class SpecificWorkoutVC: UIViewController  {
    var numberOfDrills = 1
    var randomDrills = [Int]()
    let pickerViewOption = ["Dribbling Drills", "Shooting Drills", "Combo Move Drills" ]
    var pickerViewSelected = "Dribbling Drills"
    @IBOutlet weak var amountTimeLabel: UILabel!
    
    @IBOutlet weak var sliderOutlet: UISlider!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerViewSelected = "Dribbling Drills"
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        numberOfDrills = Int(sender.value)
        amountTimeLabel.text = String(numberOfDrills)
        
    }
    
    @IBAction func generateWorkoutPressed(_ sender: UIButton) {
        print(pickerViewSelected)
    }
    @IBAction func unwindFromRandomWorkoutVC (segue: UIStoryboardSegue) {
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SpecificWorkoutToRandomWorkout" {
            let destination = segue.destination as! RandomWorkoutVC
            destination.segueName = "FromSpecificWorkout"
            destination.numberOfRows = numberOfDrills
            destination.workout = createWorkout(typeDrill: pickerViewSelected)
        }
    }
    func generateRandomArray(lowerBound: Int, upperBound: Int, amountOfNumbers: Int?) -> [Int] {
        var randomNumbers = [Int]()
        var numberofnumbers = amountOfNumbers
        let lower = UInt32(lowerBound)
        let upper = UInt32(upperBound + 1)
        if numberofnumbers == nil || numberofnumbers! > (upperBound - lowerBound) + 1 {
            numberofnumbers = (upperBound - lowerBound) + 1
        }
        while randomNumbers.count != numberofnumbers {
            let num = arc4random_uniform(upper - lower) + lower
            if !randomNumbers.contains(Int(num)) {
                randomNumbers.append(Int(num))
            }
        }
        return randomNumbers
    }
    
    func createWorkout(typeDrill: String) -> [Int]{
        if typeDrill == "Dribbling Drills" {
            randomDrills = generateRandomArray(lowerBound: 0, upperBound: 23, amountOfNumbers: numberOfDrills)
        } else if typeDrill == "Shooting Drills" {
            randomDrills = generateRandomArray(lowerBound: 24, upperBound: 31, amountOfNumbers: numberOfDrills)
        } else if typeDrill == "Combo Move Drills" {
            randomDrills = generateRandomArray(lowerBound: 32, upperBound: 38, amountOfNumbers: numberOfDrills)
        }
        return randomDrills
    }
}
extension SpecificWorkoutVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerViewOption[row]
        
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return pickerViewOption.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerViewSelected = pickerViewOption[row]
        print(pickerViewOption[row])
    }
}
