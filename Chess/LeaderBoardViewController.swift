//
//  ViewController.swift
//  Chess
//
//  Created by CTS BTP5NE18 on 8/1/16.
//  Copyright © 2016 CTS BTP5NE18. All rights reserved.
//

import UIKit

class LeaderBoardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    
    var sortOption = ["Rank", "Age", "Wins"]
    var index = Int()
    @IBOutlet weak var tableView: UITableView!
    
    var players = [Player]()

    var indexPathForSwipeRow : Int = 0
    var newRank = ""
    var newName = ""
    var newAge = ""
    var newCountry = ""
    var newPoints = ""
    
    @IBOutlet weak var sortSegmentBarToggle: UISegmentedControl!
    
    override func viewDidLoad()
    {
        players =
        [
            Player(playerRank: 1, playerName: "Viswanathan Anand", playerAge: 40, playerCountry: "India", playerPoints: 20, playerMatches: 50, playerVictories: 30, playerDefeats: 20, playerDraws: 00, playerDate : ["2016-08-09 18:39:45", "2016-08-09 18:39:45"], playerAgainst : ["Viswanathan Anand","Rahul Dravid"], playerResult : ["Draw","Won"]),
            Player(playerRank: 2, playerName: "Rahul Dravid", playerAge: 35, playerCountry: "India", playerPoints: 30, playerMatches: 80, playerVictories: 40, playerDefeats: 30, playerDraws: 10, playerDate : ["2016-08-09 18:39:45", "2016-08-09 18:39:45"], playerAgainst : ["Viswanathan Anand","Rahul Dravid"], playerResult : ["Draw","Won"]),
            Player(playerRank: 3, playerName: "Chris Gayle", playerAge: 25, playerCountry: "West Indies", playerPoints: 40, playerMatches: 90, playerVictories: 30, playerDefeats: 40, playerDraws: 20, playerDate : ["2016-08-09 18:39:45", "2016-08-09 18:39:45"], playerAgainst : ["Viswanathan Anand","Rahul Dravid"], playerResult : ["Draw","Won"]),
            Player(playerRank: 4, playerName: "Ricky Pointing", playerAge: 38, playerCountry: "Australia", playerPoints: 00, playerMatches: 30, playerVictories: 10, playerDefeats: 20, playerDraws: 00, playerDate : ["2016-08-09 18:39:45", "2016-08-09 18:39:45"], playerAgainst : ["Viswanathan Anand","Rahul Dravid"], playerResult : ["Draw","Won"]),
            Player(playerRank: 5, playerName: "Micheal Clark", playerAge: 42, playerCountry: "Australia", playerPoints: 90, playerMatches: 110, playerVictories: 60, playerDefeats: 40, playerDraws: 10, playerDate : ["2016-08-09 18:39:45", "2016-08-09 18:39:45"], playerAgainst : ["Viswanathan Anand","Rahul Dravid"], playerResult : ["Draw","Won"])
        ]
        
        let alert = UIAlertController(title: "Instruction", message: "1. It is a game playing between 2 unique players." + "\n\n" + "2. Tap on + button on the top right side to add a player." + "\n\n" + "3. Swipe left to edit/delete a particular player" + "\n\n" + "4. Tap on NEW GAME button to start a game." + "\n\n" + "5. Enjoy it.", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Play On!", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        orderingDataAfterAnEvent()
        
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        
        tableView.rowHeight = 70
        tableView.delegate = self
        tableView.dataSource = self
       
    }
        
//    override func viewWillAppear(animated: Bool)
//    {
//        orderingDataAfterAnEvent()
//        if sortSegmentBarToggle.selectedSegmentIndex == 0
//        {
//            players.sortInPlace{ $0.playerAge < $1.playerAge }
//            tableView.reloadData()
//        }
//        else if sortSegmentBarToggle.selectedSegmentIndex == 1
//        {
//            players.sortInPlace{ $0.playerRank < $1.playerRank }
//            tableView.reloadData()
//        }
//        else if sortSegmentBarToggle.selectedSegmentIndex == 2
//        {
//            players.sortInPlace{ $0.playerDefeats < $1.playerDefeats }
//            players.sortInPlace{ $0.playerVictories > $1.playerVictories }
//            tableView.reloadData()
//        }
//    }
    
    //viewDidAppear is called when the view is actually visible, and can be called multiple times during the lifecycle of a View Controller (for instance, when a Modal View Controller is dismissed and the view becomes visible again). This is where you want to perform any layout actions or do any drawing in the UI - for example, presenting a modal view controller. However, anything you do here should be repeatable. It's best not to retain things here, or else you'll get memory leaks if you don't release them when the view disappears.
    //Notifies the view controller that its view was added to a view hierarchy.
    
    override func viewDidAppear(_ animated: Bool)
    {
        orderingDataAfterAnEvent()
        if sortSegmentBarToggle.selectedSegmentIndex == 0
        {
            players.sort{ $0.playerAge < $1.playerAge }
            tableView.reloadData()
        }
        else if sortSegmentBarToggle.selectedSegmentIndex == 1
        {
            players.sort{ $0.playerMatches < $1.playerMatches }
            players.sort{ $0.playerRank < $1.playerRank }
            tableView.reloadData()
        }
        else if sortSegmentBarToggle.selectedSegmentIndex == 2
        {
            players.sort{ $0.playerDefeats < $1.playerDefeats }
            players.sort{ $0.playerVictories > $1.playerVictories }
            tableView.reloadData()
        }
    }

    @IBAction func sortSegmentBar(_ sender: AnyObject)
    {
        if sortSegmentBarToggle.selectedSegmentIndex == 0
        {
            players.sort{ $0.playerAge < $1.playerAge }
            tableView.reloadData()
        }
        else if sortSegmentBarToggle.selectedSegmentIndex == 1
        {
            players.sort{ $0.playerRank < $1.playerRank }
            tableView.reloadData()
        }
        else if sortSegmentBarToggle.selectedSegmentIndex == 2
        {
            players.sort{ $0.playerDefeats < $1.playerDefeats }
            players.sort{ $0.playerVictories > $1.playerVictories }
            tableView.reloadData()
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfSectionsInTableView section: Int) -> Int
    {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return players.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PlayersTableViewCell
        let player : Player
        player = players[indexPath.row]
        cell.rank.text = String(player.playerRank)
        cell.name.text = player.playerName
        cell.age.text = "Age: " + String(player.playerAge)
        cell.country.text = player.playerCountry
        cell.points.text = "Points: " + String(player.playerPoints) + "/100"
        cell.progressBar.progress = Float(player.playerPoints)/100.0
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]?
    {
        let edit = UITableViewRowAction(style: .normal , title: "  Edit  ")
        { action, index in
            self.indexPathForSwipeRow = indexPath.row
            self.performSegue(withIdentifier: "addPlayer1", sender: indexPath.row)
            
        }
        edit.backgroundColor = UIColor(red: 9/255, green: 122/255, blue: 0/255, alpha: 1)
        
        let delete = UITableViewRowAction(style: .normal, title: "Delete")
        { action, index in
            self.players.remove(at: indexPath.row)
            self.orderingDataAfterAnEvent()
            tableView.reloadData()

        }
        delete.backgroundColor = UIColor.red
        
        return [delete, edit]
    }
    
    func orderingDataAfterAnEvent()
    {
        players.sort{ $0.playerPoints > $1.playerPoints }
        var order = 1
        for data in players
        {
            data.playerRank = order
            order += 1
        }
    }
    
    func congratsPopUp ()
    {
        for data in players
        {
            if data.playerPoints == 100
            {
                
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "playerDetails"
        {
            let playerDetailsVC = segue.destination as! PlayerDetailsViewController
            let indexPath : IndexPath = self.tableView.indexPathForSelectedRow!
            let player : Player
            player = players[indexPath.row]
            playerDetailsVC.rankString = String(player.playerRank)
            playerDetailsVC.nameString = player.playerName
            playerDetailsVC.ageString = String(player.playerAge)
            playerDetailsVC.countryString = player.playerCountry
            playerDetailsVC.matchesString = String(player.playerMatches)
            playerDetailsVC.victoriesString = String(player.playerVictories)
            playerDetailsVC.defeatsString = String(player.playerDefeats)
            playerDetailsVC.drawsString = String(player.playerDraws)
            playerDetailsVC.totalPointsString = String(player.playerPoints)
            playerDetailsVC.playerDate = String(describing: player.playerDate)
            playerDetailsVC.playerAgainst = String(describing: player.playerAgainst)
            playerDetailsVC.playerResult = String(describing: player.playerResult)
            playerDetailsVC.players = players
            playerDetailsVC.index = indexPath.row
            
        }
        if segue.identifier == "playerSelection"
        {
            let newGameDetailsVC = segue.destination as! NewGameViewController
            newGameDetailsVC.namePlayer1 = players
        }
        if segue.identifier == "addPlayer"
        {
            let addPlayerVC = segue.destination as! AddPlayerViewController
            addPlayerVC.players = players
        }
        if segue.identifier == "addPlayer1"
        {
            let addPlayerVC = segue.destination as! AddPlayerViewController
            let player : Player
            player = players[indexPathForSwipeRow]
            addPlayerVC.nameEdit = player.playerName
            addPlayerVC.ageEdit = String(player.playerAge)
            addPlayerVC.countryEdit = player.playerCountry
            addPlayerVC.buttonTitle = "Done"
            addPlayerVC.flag1 = 1
        }
        
    }
    @IBAction func newGameButtonTapped(_ sender: AnyObject)
    {
        if players.count == 0
        {
            let alert = UIAlertController(title: "Database has no Player", message: "Please add atleast 2 players to play a match", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if players.count == 1
        {
            let alert = UIAlertController(title: "Database has only 1 Player", message: "Please add atleast 2 players to play a match", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else
        {
            performSegue(withIdentifier: "playerSelection", sender: nil)
        }
    }
    
    @IBAction func unwindToLaderBoard(_ segue: UIStoryboardSegue)
    {
        if segue.identifier == "addDetails"
        {
            let addPlayerVC = segue.source as! AddPlayerViewController
            let r = players.count + 1
            players.append(Player(playerRank: r, playerName: addPlayerVC.addPlayerName.text!, playerAge: Int(addPlayerVC.addPlayerAge.text!)!, playerCountry: addPlayerVC.addPlayerCountry.text!, playerPoints: 0, playerMatches: 0, playerVictories: 0, playerDefeats: 0, playerDraws: 0, playerDate : [""], playerAgainst : [""], playerResult : [""]))
            tableView.reloadData()
        }
        else if segue.identifier == "RefreshTableView"
        {
            tableView.reloadData()
        }
        else if segue.identifier == "done"
        {
            let addPlayerVC = segue.source as! AddPlayerViewController
            players[indexPathForSwipeRow] = Player(playerRank: 0, playerName: addPlayerVC.addPlayerName.text!, playerAge: Int(addPlayerVC.addPlayerAge.text!)!, playerCountry: addPlayerVC.addPlayerCountry.text!, playerPoints: players[indexPathForSwipeRow].playerPoints, playerMatches: players[indexPathForSwipeRow].playerMatches, playerVictories: players[indexPathForSwipeRow].playerVictories, playerDefeats: players[indexPathForSwipeRow].playerDefeats, playerDraws: players[indexPathForSwipeRow].playerDraws, playerDate : [""], playerAgainst : [""], playerResult : [""])
            tableView.reloadData()
        }
    }


}

