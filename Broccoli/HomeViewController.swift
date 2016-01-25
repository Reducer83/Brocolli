//
//  ViewController.swift
//  Broccoli
//
//  Created by Richard Thomson on 02/01/2016.
//  Copyright © 2016 Richard Thomson. All rights reserved.
//

import UIKit

//Set Up Game settings:
//Timer length
//Random cards?
//'Reset game' method

var RoundNames = ["Describing","Acting","One Word","Just The Face"]
var CurrentGame = Game()
var TimerLength = 60

class ViewController: UIViewController {
    
    @IBOutlet var LengthOfTurnField: UITextField!
    @IBOutlet var NumberOfTeamsField: UITextField!

    @IBAction func NewGameButton(sender: AnyObject) {
        
    TimerLength = Int(LengthOfTurnField.text!)!
    CurrentGame.NumberOfTeams = Int(NumberOfTeamsField.text!)!
    
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    //RESET GAME DATA
        
    //DISPLAY LENGTH OF TURN
        
    LengthOfTurnField.text = String(TimerLength)
    NumberOfTeamsField.text = "2"
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

