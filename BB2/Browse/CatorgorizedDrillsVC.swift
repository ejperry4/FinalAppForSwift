//
//  CatorgorizedDrillsVC.swift
//  BB2
//
//  Created by Ej Perry on 4/29/18.
//  Copyright © 2018 Perry. All rights reserved.
//

import UIKit

class CatorgorizedDrillsVC: UIViewController {
    
    var selectedCatagory: String?
    
    @IBOutlet weak var catorgorizedTableView: UITableView!
    
    var drillNames = ["Right Hand Pound", "Left Hand Pound", "Crossover","Between The Legs (Right Foot Foward)", "Between The Legs (Left Foot Foward)", "In and Out Right", "In and Out Left", "Up and Back Right", "Up and Back Left", "Side to Side Right", "Side to Side Left", "Behind The Back", "Around the Leg Right", "Around the Leg Left", "Figure 8", "2 Ball Pound Together High", "2 Ball Pound Together Low", "2 Ball In and Out", "2 Ball Around One Leg Right", "2 Ball Around One Leg Left", "2 Ball Crossover", "2 Ball Up and Back", "2 Ball Figure 8", "Make 3 Step Back", "Elbow To Elbow Shooting", "Around The World", "5 Spot Shooting", "Hot Spot", "Mikan", "Reverse Mikan","One Dribble Pull Up", "Behind The Back Crossover", "Between The Legs Behind The Back", "Crossover Behind The Back", "Crossover Between The Legs", "Double Crossover", "Hesitation Behind The Back", "In and Out Crossover" ]
    var gifNames = ["RightPound", "PoundLeft", "Crossover", "BetweenTheLegsRightFootFoward","BetweenTheLegsLeftFootFoward", "InandOutRight", "InandOutRight", "UpandBackRight", "UpandBackLeft", "SidetoSideRight", "SideToSideLeft", "BehindTheBack", "AroundLegRight", "AroundOneLegLeft", "Figure8", "2BallDribblePoundHigh", "2BallDribblePoundLow", "2BallDribbleInandOut", "2BallAroundRightLeg", "2BallAroundOneLegLeft", "2BallDribbleCross", "2BallUpandBack", "2BallDribbleFigure8", "Make3StepBack", "ElbowToElbowShooting","AroundTheWorld", "FiveSpotTogether", "HotSpot", "Micken", "ReverseMicken", "OneDribblePullUpLeft", "ComboBehindTheBackCross", "ComboBetweenTheLegsBehindTheBack", "ComboCrossBehindTheBack", "ComboCrossBetweenLegs", "ComboDoubleCross", "ComboHesitationBehindTheBack", "ComboInandoutCross"]
    var drillDescriptions = ["As hard as you can with your right hand pound the ball into the floor. Try to throw the ball through the floor!", "As hard as you can with your left hand pound the ball into the floor. Try to throw the ball through the floor!", "Bounce the ball from one hand to the other.","Put your right foot foward and bounce the ball between your legs from one hand to the other.", "Put your left foot foward and bounce the ball between your legs from one hand to the other.", "Fake like you're going to crossover than pull the ball back.", "Fake like you're going to crossover than pull the ball back.", "Bounce the ball up and back to the right side of your body", "Bounce the ball up and back to the left side of your body", "Bounce the ball across the front of your body only using your right hand", "Bounce the ball across the front of your body only using your right hand", "Bounce the ball back and forth behind your back", "Using small dribbles trace around your right leg.", "Using small dribbles trace around your right leg.", "Using small dribbles, trace the number 8 going around your legs", "Dribble to balls together up at your shoulder height, as hard as you can.", "Dribble to balls together down at your ankles, as hard as you can.", "Go in and out dribbling both balls at the same time.", "Trace your right foot using small dribbles, while dribble another ball with your left hand", "Trace your left foot using small dribbles, while dribble another ball with your right hand", "Dribbling 2 balls toghether, dribble once or twice then cross the balls, one in front the other behind.", "Dribble both balls on the outside of your body going up and back at the same time.", "Trace the shape of an 8 using both balls, passing them from hand to hand in the process.", "Make 3 shots in a row, then step back. See how far back you can go.", "Shoot from one of the elbows of the free throw line, get your rebound then shoot from the other side. See how many you can make in a row.", "Make a shot from the block, free throw lane, elbow or free throw line, and just inside the 3pt line, then go in the reverse order on the other side.", "Make a shot from each of the 5 spots around the 3pt line. If you do it go back the other way.", "Make a baseline jumper from both side, elbow jumper on both sides, and a 3 pointer", "Go back and forth making layups. Don't Let the ball hit the ground", "Face out towards the court, go back and forth making layups. Don't Let the ball hit the ground", "Start at the top of the 3 pt line and take one dribble than shoot a jump shot", "Start behind the 3 pt line, and make a behind the back move, then immeadiately crossover. Finish the play with a layup (Or Dunk!!)", "Start behind the 3 pt line, and make a between the legs move, then immeadiately go behind your back. Finish the play with a layup (Or Dunk!!)", "Crossover Behind The Back", "Start behind the 3 pt line, and make a crossover move, then immeadiately go between the legs. Finish the play with a layup (Or Dunk!!)", "Double Crossover", "Start behind the 3 pt line, and make a hesitation move (lift up and slow down), then immeadiately go behind the back. Finish the play with a layup (Or Dunk!!)", "Start behind the 3 pt line, and make an in and out move, then immeadiately crossover. Finish the play with a layup (Or Dunk!!)"]
    var drillTimes = [0.30, 0.30, 0.45, 0.30, 0.30, 0.30, 0.30, 0.30, 0.30, 0.30, 0.30, 0.45, 0.30, 0.30, 0.45, 0.45, 0.45, 0.45, 0.30, 0.30, 0.45, 0.45, 0.45, 1.80, 1.80, 3.00, 3.00, 0.60, 0.60, 4.00, 0.60, 0.60, 0.60, 0.60, 0.60, 0.60, 0.60, 0.60]
    
    var drills: [Drills] = []
    
    //var drillPicked = [String?]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for index in 0...drillNames.count - 1 {
            drills.append(Drills(name: drillNames[index], description:
                drillDescriptions[index], gif: gifNames[index], time: drillTimes[index]))
        }
        
        catorgorizedTableView.delegate = self
        catorgorizedTableView.dataSource = self
        print(selectedCatagory!)
    }
}
extension CatorgorizedDrillsVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch selectedCatagory! {
        case "DribblingDrills" :
            //drillPicked = stationaryDribblingArray
            return 23
        case "ShootingDrills" :
            //drillPicked = twoBallDribblingArray
            return 8
        case "ComboMoves" :
            //drillPicked = shootingDrillsArray
            return 7
        default :
            print("ERROR")
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = catorgorizedTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        switch selectedCatagory {
        case "DribblingDrills" :
            cell.textLabel?.text = drillNames[indexPath.row]
        case "ShootingDrills" :
            cell.textLabel?.text = drillNames[indexPath.row + 23]
        case "ComboMoves" :
            cell.textLabel?.text = drillNames[indexPath.row + 31]
       
        default :
            print("Error")
        }
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CatorgorizedToDrill" {
            let destination = segue.destination as! DrillVC
            let selectedIndex = catorgorizedTableView.indexPathForSelectedRow!.row
            if selectedCatagory == "DribblingDrills" {
                //destination.drillName = drillNames[selectedIndex]
                destination.drills = drills[selectedIndex]
                //destination.startTimer = selectedIndex
            } else if selectedCatagory == "ShootingDrills" {
                //destination.drillName = drillNames[selectedIndex + 23]
                destination.drills = drills[selectedIndex + 23]
                //destination.startTimer = selectedIndex
            } else if selectedCatagory == "ComboMoves" {
               // destination.drillName = drillNames[selectedIndex + 31]
                destination.drills = drills[selectedIndex + 31]
               // destination.startTimer = selectedIndex
            }
            
        }
    }
    @IBAction func unwindFromDrillVC (segue: UIStoryboardSegue) {
        
    }
}

