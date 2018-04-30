//
//  BrowseVC.swift
//  BB2
//
//  Created by Ej Perry on 4/28/18.
//  Copyright © 2018 Perry. All rights reserved.
//

import UIKit

class BrowseVC: UIViewController {
    
    var drillCategoriesArray = ["Stationary Ball Handling", "2 Ball Dribbling", "Shooting Drills", "Combo Drills"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "ShootingDrillsToBrowse":
            let destination = segue.destination as! CatorgorizedDrillsVC
            destination.selectedCatagory = "ShootingDrills"
        case "DribblingDrillsToBrowse":
            let destination = segue.destination as! CatorgorizedDrillsVC
            destination.selectedCatagory = "DribblingDrills"
        case  "ComboMovesToDrills":
            let destination = segue.destination as! CatorgorizedDrillsVC
            destination.selectedCatagory = "ComboMoves"
        default:
            print("ERROR")
        }

    }
    @IBAction func unwindFromCatorgorizedVC(segue: UIStoryboardSegue) {
        
    }
    
    @IBAction func dribblingDrillsButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func shootingDrillsButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func comboMovesButtonPressed(_ sender: UIButton) {
        
        
    }
}

