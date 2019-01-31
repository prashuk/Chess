//
//  ResultsViewController.swift
//  Chess
//
//  Created by CTS BTP5NE18 on 8/2/16.
//  Copyright © 2016 CTS BTP5NE18. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController
{

    @IBOutlet weak var wonName: UILabel!
    @IBOutlet weak var pleaseWait: UILabel!
    
    var wonNameString = ""
    var lossNameString = ""
    var drawNameString = ""
    var player1Draw = ""
    var player2Draw = ""
    var flag = ""
    var currentTime = ""
    
    @IBOutlet weak var BackToLeaderBoard: UIButton!
    
    @IBOutlet weak var progressBar: UIProgressView!
    var progressBarTimer:Timer!
    
    var players = [Player]()
    override func viewDidLoad()
    {
        self.progressBarTimer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(ResultsViewController.updateProgressBar), userInfo: nil, repeats: true)
        progressBar.progress = 0.0
        self.navigationItem.setHidesBackButton(true, animated:true)
        super.viewDidLoad()
        if flag == "1"
        {
            wonName.text = "Match Draw!"
        }
        else if flag == "0"
        {
            wonName.text = wonNameString + " Won!"
        }
        BackToLeaderBoard.isEnabled = false
        BackToLeaderBoard.setTitleColor(UIColor.lightGray, for: UIControl.State())
        
    }
    
    @objc func updateProgressBar()
    {
        self.progressBar.progress += 0.0001
        if self.progressBar.progress == 1.0
        {
            self.progressBar.removeFromSuperview()
            BackToLeaderBoard.isEnabled = true
            BackToLeaderBoard.setTitleColor(UIColor.black, for: UIControl.State())
            pleaseWait.isHidden = true
            
        }
        
    }
    
    @IBAction func ResultEvaluation_BackToLeaderBoardPressed(_ sender: AnyObject)
    {
        if drawNameString == "Match Draw"
        {
            for data in players
            {
                if data.playerName == player1Draw
                {
                    print("Previous Data: Matches: \(data.playerMatches), \(data.playerDraws), \(data.playerPoints)")
                    data.playerMatches += 1
                    data.playerDraws += 1
                    data.playerPoints += 1
                    data.playerDate.append(currentTime)
                    data.playerAgainst.append(player2Draw)
                    data.playerResult.append("Draw")
                    print("New Data: Matches: \(data.playerMatches), \(data.playerDraws), \(data.playerPoints)")
                }
                else if data.playerName == player2Draw
                {
                    print("Previous Data: Matches: \(data.playerMatches), \(data.playerDraws), \(data.playerPoints)")
                    data.playerMatches += 1
                    data.playerDraws += 1
                    data.playerPoints += 1
                    data.playerDate.append(currentTime)
                    data.playerAgainst.append(player1Draw)
                    data.playerResult.append("Draw")
                    print("New Data: Matches: \(data.playerMatches), \(data.playerDraws), \(data.playerPoints)")
                }
            }
        }
        else
        {
            for data in players
            {
                if data.playerName == wonNameString
                {
                    print("Previous Data: Matches: \(data.playerMatches), \(data.playerDraws), \(data.playerPoints)")
                    data.playerMatches += 1
                    data.playerVictories += 1
                    data.playerPoints += 2
                    data.playerDate.append(currentTime)
                    data.playerAgainst.append(lossNameString)
                    data.playerResult.append("Won")
                    print("New Data: Matches: \(data.playerMatches), \(data.playerDraws), \(data.playerPoints)")
                }
                else if data.playerName == lossNameString
                {
                    print("Previous Data: Matches: \(data.playerMatches), \(data.playerDraws), \(data.playerPoints)")
                    data.playerMatches += 1
                    data.playerDefeats += 1
                    data.playerPoints -= 1
                    if data.playerPoints < 0
                    {
                        data.playerPoints = 0
                    }
                    data.playerDate.append(currentTime)
                    data.playerAgainst.append(wonNameString)
                    data.playerResult.append("Loss")
                    print("New Data: Matches: \(data.playerMatches), \(data.playerDraws), \(data.playerPoints)")
                }
            }
        }
    }
    
}
