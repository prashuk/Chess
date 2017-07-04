//
//  PlayersTableViewCell.swift
//  Chess
//
//  Created by CTS BTP5NE18 on 8/1/16.
//  Copyright © 2016 CTS BTP5NE18. All rights reserved.
//

import UIKit

class PlayersTableViewCell: UITableViewCell
{
    @IBOutlet weak var rank: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var points: UILabel!
}
