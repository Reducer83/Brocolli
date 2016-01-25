//
//  Team.swift
//  Broccoli
//
//  Created by Richard Thomson on 02/01/2016.
//  Copyright © 2016 Richard Thomson. All rights reserved.
//

import UIKit

class Team: NSObject {
    
    init(TeamName: String, TeamScore: Int) {
        
        self.TeamName = TeamName
        self.TeamScore = TeamScore
        
    }
    
    var TeamName: String
    var TeamScore: Int
    
    
}
