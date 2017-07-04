//
//  HistoryViewController.swift
//  Chess
//
//  Created by CTS BTP5NE18 on 8/4/16.
//  Copyright © 2016 CTS BTP5NE18. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    var players = [Player]()
    var index = Int()
    var dateString = ""
    var againstString = ""
    var resultString = ""

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad()
    {
        tableView.delegate = self
        tableView.dataSource = self
        print(index)
        print(players[index].playerName)
        
        super.viewDidLoad()
    }

    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (players[index].playerDate).count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) as! HistoryTableViewCell
        cell1.date.text = players[index].playerDate[indexPath.row]
        cell1.against.text = players[index].playerAgainst[indexPath.row]
        cell1.result.text = players[index].playerResult[indexPath.row]
        return cell1

    }
}
