//
//  HomeVC.swift
//  BB2
//
//  Created by Ej Perry on 4/28/18.
//  Copyright © 2018 Perry. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    var numberOfDrills = 10
    var drillsArray = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

    }
    @IBAction func generateWorkoutButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func unwindFromSpecificWorkoutVC (segue: UIStoryboardSegue) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GenerateWorkoutToRandomWorkout" {
            let destination = segue.destination as! RandomWorkoutVC
            destination.segueName = "FromGenerateWorkout"
            destination.workout = generateRandomArray(lowerBound: 0, upperBound: 37, amountOfNumbers: numberOfDrills)
            destination.numberOfRows = numberOfDrills
            
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
}

