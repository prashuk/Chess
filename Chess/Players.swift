//
//  Players.swift
//  Chess
//
//  Created by CTS BTP5NE18 on 8/1/16.
//  Copyright © 2016 CTS BTP5NE18. All rights reserved.
//

import Foundation

class Player
{
    var playerRank : Int
    var playerName : String
    var playerAge : Int
    var playerCountry : String
    var playerPoints : Int
    var playerMatches : Int
    var playerVictories : Int
    var playerDefeats : Int
    var playerDraws : Int
    var playerDate: [String]
    var playerAgainst : [String]
    var playerResult : [String]
    
    init(playerRank: Int, playerName : String, playerAge : Int, playerCountry : String, playerPoints : Int, playerMatches : Int, playerVictories : Int, playerDefeats : Int, playerDraws : Int, playerDate : [String], playerAgainst : [String], playerResult : [String])
    {
        self.playerRank = playerRank
        self.playerName = playerName
        self.playerAge = playerAge
        self.playerCountry = playerCountry
        self.playerPoints = playerPoints
        self.playerMatches = playerMatches
        self.playerVictories = playerVictories
        self.playerDefeats = playerDefeats
        self.playerDraws = playerDraws
        self.playerDate = playerDate
        self.playerAgainst = playerAgainst
        self.playerResult = playerResult
    }
}