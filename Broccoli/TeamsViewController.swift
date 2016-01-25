//
//  TeamsViewController.swift
//  Broccoli
//
//  Created by Richard Thomson on 02/01/2016.
//  Copyright © 2016 Richard Thomson. All rights reserved.
//

import UIKit

class TeamsViewController: UIViewController {

    
    @IBOutlet var TeamAText: UITextField!
    @IBOutlet var ConfirmTeamsButton: UIButton!
    @IBOutlet var ErrorMsgLabel: UILabel!
    
    @IBAction func ConfirmTeamsButtonMethod(sender: AnyObject) {
        
        //If team name is blank
        
        if (TeamAText.text?.isEmpty)! == true {
            ErrorMsgLabel.text = "Please Enter a Team Name"
             }
        
        if (TeamAText.text?.isEmpty)! == false {
            
            //Reset error text
            ErrorMsgLabel.text = ""
            
            //Add team and set score/name
            var TeamA = Team(TeamName: TeamAText.text!, TeamScore: 0)
            CurrentGame.teams.append(TeamA)
            
            // More teams to enter
            if CurrentGame.teams.count < CurrentGame.NumberOfTeams {
                TeamAText.text = ""
                TeamAText.placeholder = "Enter Team " + String(CurrentGame.teams.count+1) + " name here"
                
            }
            
            if CurrentGame.teams.count == CurrentGame.NumberOfTeams {
                performSegueWithIdentifier("TeamViewToCardView", sender: nil)
            }
            // No more teams to enter
        }
   
        
        
        // Add add team and set team name and score
        // IF count of team array is less than number of teams 
            // Load populate placeholder text
            //
        
        // IF team array = number of teams
            // seguewith identifier to card screen
        
        //TEST
            print(CurrentGame.teams.count)
      
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set Error message to blank
        ErrorMsgLabel.text = ""

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
