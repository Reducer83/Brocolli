//
//  GameViewController.swift
//  Broccoli
//
//  Created by Richard Thomson on 09/01/2016.
//  Copyright © 2016 Richard Thomson. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    var cardNumber = 0
    var gameTimeCounter = TimerLength
    var timer2 = NSTimer()
    var passes = 2
    
   
    @IBOutlet var CardNameLabel: UILabel!
    @IBOutlet var CountdownLabel: UILabel!
    @IBOutlet var TeamNameLabel: UILabel!
    @IBOutlet var RoundNameLabel: UILabel!
   
    @IBOutlet var InfoLabel: UILabel!
    @IBOutlet var SeeScoresButton: UIButton!
    @IBOutlet var PassButtonLabel: UIButton!
    @IBOutlet var GotItButtonLabel: UIButton!
    @IBOutlet var ResumeButton: UIButton!
    @IBOutlet var clockImageView: UIImageView!
    @IBOutlet var CardImageView: UIImageView!
    
    
    
    @IBAction func GotitFunction(sender: AnyObject) {
        
        // Update Scores
        CurrentGame.GoScore = CurrentGame.GoScore + 1
        CurrentGame.teams[CurrentGame.activeTeam].TeamScore = CurrentGame.teams[CurrentGame.activeTeam].TeamScore + 1
        
        //Remove card which has been guessed
        CurrentGame.availCards.removeAtIndex(cardNumber)
        
        //Logic for removing passed card from pass array
        
        
        if CurrentGame.availCards.isEmpty == false {
        CardNameLabel.text = SelectCard()
            }
        else {
            
            //If there are cards in pass array, choose one of those cards
            //If pass array is empty
            finalCard()
            // Deal with running out of cards!!
            }
    }
    
    
    @IBOutlet var PassLabel: UIButton!
    @IBAction func PassFunction(sender: AnyObject) {
        
        //remove a pass
        //Add passed card to passed array
        //Generate random card
        
        
        /*
        passes = passes - 1
        if passes > 0 {
            var lastCard = CardNameLabel.text
            CardNameLabel.text = SelectCard()
                if CardNameLabel.text = lastCard [
            ]
        }
*/
        }
    
    
    @IBAction func ResumeButtonMethod(sender: AnyObject) {
        restartGo()
    }
    
    // testing the segue to finish screen
    @IBAction func clickForScoresButton(sender: AnyObject) {
        //performSegueWithIdentifier("GameToFinish", sender: nil)
    }
    
    func SelectCard() -> String {
        
        cardNumber = Int(arc4random_uniform(UInt32(CurrentGame.availCards.count)))

        return CurrentGame.availCards[cardNumber]
        
    }
    
    func gameTimerCountdown() {
        
        if gameTimeCounter > 0  {
            CountdownLabel.text = String(gameTimeCounter)
            gameTimeCounter = gameTimeCounter - 1
        }
        
        if gameTimeCounter <= 0  {
            CountdownLabel.text = "TIME UP"
            timer2.invalidate()
            timerEnd()
        }
        
    }
    
    
    func finalCard() {
        // pause clock
        timer2.invalidate()
        
        // Show message explaining cards are finished
        InfoLabel.text = "Out of Cards. Click to 'Resume' to begin next round"
        // reset the available cards
        CurrentGame.availCards = CurrentGame.allCards
        
        // Invalidate buttons
        GotItButtonLabel.enabled = false
        PassLabel.enabled = false
        ResumeButton.enabled = true
        
        
        // Provide restard buttons
        
        
        // Increment round by 1
        CurrentGame.Round = CurrentGame.Round + 1
    }
    
    func restartGo() {
        // restart timer
        timer2 = NSTimer.scheduledTimerWithTimeInterval(1, target:self, selector: Selector("gameTimerCountdown"), userInfo: nil, repeats: true)
        
        // choose card
        CardNameLabel.text = SelectCard()
        
        // Update round label
        RoundNameLabel.text = RoundNames[CurrentGame.Round - 1]
        
        // Resume button disabled
        GotItButtonLabel.enabled = true
        PassLabel.enabled = true
        ResumeButton.enabled = false
        
        // Hide "out of cards message"
        InfoLabel.text = ""
    }
    
    func timerEnd() {
        // Show message containing score
        InfoLabel.text = "You Scored " + String(CurrentGame.GoScore) + "points"
      
        
        // invalidate buttons
        GotItButtonLabel.enabled = false
        PassLabel.enabled = false
        SeeScoresButton.enabled = true
        
        // increment active team by 1
        
        if CurrentGame.activeTeam == CurrentGame.teams.count {
            CurrentGame.activeTeam = 0
        }
        else {
            CurrentGame.activeTeam = CurrentGame.activeTeam + 1
        }
    }
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Enable/disable buttons
        SeeScoresButton.enabled = false
        ResumeButton.enabled = false
        
        //Reset Score for the 'go'
        CurrentGame.GoScore = 0
        
        //Reset Counter
        gameTimeCounter = TimerLength
        CountdownLabel.text = String(gameTimeCounter)
        
        //Reset The team name, round name, available passes
        RoundNameLabel.text = RoundNames[CurrentGame.Round - 1]
        passes = 2
        TeamNameLabel.text = CurrentGame.teams[CurrentGame.activeTeam].TeamName
        
        //Pick first card
        CardNameLabel.text = SelectCard()
        
        // Start timer
        timer2 = NSTimer.scheduledTimerWithTimeInterval(1, target:self, selector: Selector("gameTimerCountdown"), userInfo: nil, repeats: true)
        
        // Start info label
        InfoLabel.text = ""
        
        //Set colours
        
        GotItButtonLabel.backgroundColor = UIColor.blueColor()
        PassLabel.backgroundColor = UIColor.orangeColor()
        SeeScoresButton.backgroundColor = UIColor.greenColor()
        clockImageView.image = UIImage(named:"clockFace")
        CardImageView.image = UIImage(named:"paperScrap")

        
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
