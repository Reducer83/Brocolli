//
//  WriteCards.swift
//  Broccoli
//
//  Created by Richard Thomson on 03/01/2016.
//  Copyright © 2016 Richard Thomson. All rights reserved.
//

import UIKit

class WriteCards: UIViewController {
   
    @IBOutlet var SubmittedCardsLabel: UILabel!
    @IBOutlet var CardTextView: UITextField!
    @IBAction func AddCardButton(sender: AnyObject) {
        CurrentGame.allCards.append(CardTextView.text!)
        CardTextView.text = ""
        SubmittedCardsLabel.text = "You have submitted " + String(CurrentGame.allCards.count) + " cards"
        dump(CurrentGame.allCards)
    }
    
    
    @IBAction func StartGameButton(sender: AnyObject) {
        
        CurrentGame.availCards = CurrentGame.allCards
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        CardTextView.placeholder = "Type your entries here. Make them good!"
        SubmittedCardsLabel.text = "You have submitted " + String(CurrentGame.allCards.count) + " cards"

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
