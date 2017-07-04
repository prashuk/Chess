//
//  PlayerDetailsViewController.swift
//  Chess
//
//  Created by CTS BTP5NE18 on 8/1/16.
//  Copyright © 2016 CTS BTP5NE18. All rights reserved.
//

import UIKit

class PlayerDetailsViewController: UIViewController {

    @IBOutlet weak var rank: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var matches: UILabel!
    @IBOutlet weak var victories: UILabel!
    @IBOutlet weak var defeats: UILabel!
    @IBOutlet weak var draws: UILabel!
    @IBOutlet weak var totalPoints: UILabel!
    @IBOutlet weak var totalPointsLabel2: UILabel!
    
    var rankString = ""
    var nameString = ""
    var ageString = ""
    var countryString = ""
    var matchesString = ""
    var victoriesString = ""
    var defeatsString = ""
    var drawsString = ""
    var totalPointsString = ""
    var playerDate = ""
    var playerAgainst = ""
    var playerResult = ""
    
    var players = [Player]()
    var index = Int()
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        rank.text = rankString
        name.text = nameString
        age.text = ageString
        country.text = countryString
        matches.text = matchesString
        victories.text = victoriesString
        defeats.text = defeatsString
        draws.text = drawsString
        totalPoints.text = totalPointsString
        progressBar.progress = Float(totalPointsString)!/100.0
        totalPointsLabel2.text = "Points: " + totalPointsString + "/100"
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "history"
        {
            let cell = segue.destination as! HistoryViewController
            cell.players = players
            cell.index = index
            cell.dateString = playerDate
            cell.againstString = playerAgainst
            cell.resultString = playerResult
        }
    }

}
