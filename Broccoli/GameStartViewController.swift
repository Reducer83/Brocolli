//
//  GameStartViewController.swift
//  Broccoli
//
//  Created by Richard Thomson on 09/01/2016.
//  Copyright © 2016 Richard Thomson. All rights reserved.
//

import UIKit

class GameStartViewController: UIViewController {
    
    
    @IBOutlet var Team1NameLabel: UILabel!
    @IBOutlet var Team2NameLabel: UILabel!
    @IBOutlet var Team3NameLabel: UILabel!
    @IBOutlet var Team4NameLabel: UILabel!
    
    @IBOutlet var Team1ScoreLabel: UILabel!
    @IBOutlet var Team2ScoreLabel: UILabel!
    @IBOutlet var Team3ScoreLabel: UILabel!
    @IBOutlet var Team4ScoreLabel: UILabel!
    
    
    @IBOutlet var TeamNameLabel: UILabel!
    @IBOutlet var RoundNameLabel: UILabel!
    @IBOutlet var countdownLabel: UILabel!
    @IBOutlet var StartCountdownLabel: UIButton!
    
    var counter = 3
    var timer1 = NSTimer()
    
    func updateCountdownCounter() {
        counter = counter - 1
        
        if counter > 0 {
        countdownLabel.text = String(counter)
        }
        if counter == 0 {
            countdownLabel.text = "GO"
        }
        if counter < 0 {
    performSegueWithIdentifier("GameStartToGameView", sender: nil)
        timer1.invalidate()
    }
    }

    @IBAction func StartCountdownButton(sender: AnyObject) {
        
        timer1 = NSTimer.scheduledTimerWithTimeInterval(0.75, target:self, selector: Selector("updateCountdownCounter"), userInfo: nil, repeats: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        /*
        //Tests
        print(CurrentGame.teams[0].TeamName)
        print(CurrentGame.teams[0].TeamScore)
        print(CurrentGame.teams[1].TeamName)
        print(CurrentGame.teams[1].TeamScore)
        print(CurrentGame.teams[2].TeamName)
        print(CurrentGame.teams[2].TeamScore)
        print(CurrentGame.teams[3].TeamName)
        print(CurrentGame.teams[3].TeamScore)
        */
        // Set the round name
        
        RoundNameLabel.text = RoundNames[CurrentGame.Round - 1]
        TeamNameLabel.text = CurrentGame.teams[CurrentGame.activeTeam].TeamName
        
        StartCountdownLabel.backgroundColor = UIColor.greenColor()
        StartCountdownLabel.layer.cornerRadius = 10
        
        //Set the team name and score labels
        
       if CurrentGame.teams.count > 0 {
       Team1NameLabel.text = CurrentGame.teams[0].TeamName + ":"
       Team1ScoreLabel.text = String(CurrentGame.teams[0].TeamScore)
        }
        

        if CurrentGame.teams.count > 1 {
        Team2NameLabel.text = CurrentGame.teams[1].TeamName + ":"
        Team2ScoreLabel.text = String(CurrentGame.teams[1].TeamScore)
        }
        
        
        if CurrentGame.teams.count > 2 {
        Team3NameLabel.text = CurrentGame.teams[2].TeamName + ":"
        Team3ScoreLabel.text = String(CurrentGame.teams[2].TeamScore)
        }
        
        
        if CurrentGame.teams.count > 3 {
        Team4NameLabel.text = CurrentGame.teams[3].TeamName + ":"
        Team4ScoreLabel.text = String(CurrentGame.teams[3].TeamScore)
        }
        
        if CurrentGame.teams.count < 3 {
            Team3NameLabel.text = ""
            Team3ScoreLabel.text = ""
            Team4NameLabel.text = ""
            Team4ScoreLabel.text = ""
        }
        
        if CurrentGame.teams.count < 4 {
            Team4NameLabel.text = ""
            Team4ScoreLabel.text = ""
        }


        
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
