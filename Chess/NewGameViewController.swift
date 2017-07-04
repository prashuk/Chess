//
//  NewGameViewController.swift
//  Chess
//
//  Created by CTS BTP5NE18 on 8/1/16.
//  Copyright © 2016 CTS BTP5NE18. All rights reserved.
//

import UIKit
import Darwin
import Foundation

class NewGameViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate
{

    @IBOutlet weak var player1: UITextField!
    @IBOutlet weak var player2: UITextField!
    
    @IBOutlet weak var StartButton: UIButton!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    var namePlayer1 = [Player]()
    var namePlayerAll = [Player]()
    var namePlayer1Name = [String]()
    var namePlayer2 = [Player]()
    
    var runForPlayer1 = Int()
    var runForPlayer2 = Int()
    var flag = 0
    var flagAnother = 0
    var aPicker: UIPickerView!
    var bPicker: UIPickerView!
    
    var resultWon = String()
    var resultLoss = String()
    var resultDraw = String()
    var player1Draw = String()
    var player2Draw = String()
    var flag1 = "0"
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        namePlayerAll = namePlayer1
        namePlayer2 = namePlayer1
        
        let picker1: UIPickerView
        picker1 = UIPickerView(frame: CGRect(x: 0, y: 10, width: view.frame.width, height: 150))
        picker1.backgroundColor = .white
        
        picker1.showsSelectionIndicator = true
        picker1.delegate = self
        picker1.dataSource = self
        
        let toolBar1 = UIToolbar()
        toolBar1.barStyle = UIBarStyle.default
        toolBar1.isTranslucent = true
        toolBar1.tintColor = UIColor(red: 9/255, green: 122/255, blue: 0/255, alpha: 1)
        toolBar1.sizeToFit()
        
        let doneButton1 = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(NewGameViewController.donePicker1))
        let spaceButton1 = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton1 = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(NewGameViewController.cancelPicker1))
        
        toolBar1.setItems([cancelButton1, spaceButton1, doneButton1], animated: false)
        toolBar1.isUserInteractionEnabled = true
        
        player1.inputView = picker1
        player1.inputAccessoryView = toolBar1
        
        player1.delegate = self
        
        self.aPicker = picker1
        
        let picker2: UIPickerView
        picker2 = UIPickerView(frame: CGRect(x: 0, y: 10, width: view.frame.width, height: 150))
        picker2.backgroundColor = .white
        
        picker2.showsSelectionIndicator = true
        picker2.delegate = self
        picker2.dataSource = self
        
        let toolBar2 = UIToolbar()
        toolBar2.barStyle = UIBarStyle.default
        toolBar2.isTranslucent = true
        toolBar2.tintColor = UIColor(red: 9/255, green: 122/255, blue: 0/255, alpha: 1)
        toolBar2.sizeToFit()
        
        let doneButton2 = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(NewGameViewController.donePicker2))
        let spaceButton2 = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton2 = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(NewGameViewController.cancelPicker2))
        
        toolBar2.setItems([cancelButton2, spaceButton2, doneButton2], animated: false)
        toolBar2.isUserInteractionEnabled = true
        
        player2.inputView = picker2
        player2.inputAccessoryView = toolBar2
        
        player2.delegate = self
        
        self.bPicker = picker2
       
        StartButton.isEnabled = false
}

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        if pickerView == self.aPicker
        {
            return namePlayer1.count
        }
        else if pickerView == self.bPicker
        {
            return namePlayer2.count
        }
        else
        {
            return 0
        }
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        if pickerView == self.aPicker
        {
            return namePlayer1[row].playerName
        }
        else if pickerView == self.bPicker
        {
            return namePlayer2[row].playerName
        }
        else
        {
            return ""
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if pickerView == self.aPicker
        {
            player1.text = namePlayer1[row].playerName
        }
        else if pickerView == self.bPicker
        {
            player2.text = namePlayer2[row].playerName
        }
    }
    
    
    func donePicker1(_ pickerView: UIPickerView)
    {
        if player1.text == ""
        {
            player1.text = namePlayer1[0].playerName
        }
        runForPlayer1 = Int(arc4random())
        player1.resignFirstResponder()
        var nameXXX = [Player]()
        for x in namePlayerAll
        {
            if x.playerName == player1.text
            {
                
            }
            else
            {
                nameXXX.append(x)
            }
        }
        namePlayer2 = nameXXX
        
        if player1.text == "" || player2.text == ""
        {
            messageLabel.text = "Select Players"
            StartButton.isEnabled = false
            StartButton.setTitleColor(UIColor.lightGray, for: UIControlState())
        }
        else
        {
            messageLabel.text = "Start Play"
            StartButton.isEnabled = true
            StartButton.setTitleColor(UIColor.black, for: UIControlState())
        }
        print(runForPlayer1)
        
    }
    func donePicker2(_ pickerView: UIPickerView)
    {
        if player2.text == ""
        {
            player2.text = namePlayer2[0].playerName
        }
        runForPlayer2 = Int(arc4random())
        player2.resignFirstResponder()
        var nameYYY = [Player]()
        for x in namePlayerAll
        {
            if x.playerName == player2.text
            {
                
            }
            else
            {
                nameYYY.append(x)
            }
        }
        namePlayer1 = nameYYY
        
        if player1.text == "" || player2.text == ""
        {
            messageLabel.text = "Select Players"
            StartButton.isEnabled = false
            StartButton.setTitleColor(UIColor.lightGray, for: UIControlState())
        }
        else
        {
            messageLabel.text = "Start Play"
            StartButton.isEnabled = true
            StartButton.setTitleColor(UIColor.black, for: UIControlState())
        }
        print(runForPlayer2)
        
    }
    
    func cancelPicker1(_ pickerView: UIPickerView)
    {
        player1.resignFirstResponder()
        player1.text = ""
        var nameXXX = [Player]()
        for x in namePlayerAll
        {
            if x.playerName == player1.text
            {
                
            }
            else
            {
                nameXXX.append(x)
            }
        }
        namePlayer2 = nameXXX
        StartButton.isEnabled = false
        messageLabel.text = "Select Players"
        StartButton.setTitleColor(UIColor.lightGray, for: UIControlState())
    }
    func cancelPicker2(_ pickerView: UIPickerView)
    {
        player2.resignFirstResponder()
        player2.text = ""
        var nameYYY = [Player]()
        for x in namePlayerAll
        {
            if x.playerName == player2.text
            {
                
            }
            else
            {
                nameYYY.append(x)
            }
        }
        messageLabel.text = "Select Players"
        namePlayer1 = nameYYY
        StartButton.isEnabled = false
        StartButton.setTitleColor(UIColor.lightGray, for: UIControlState())
    }
    
    
    @IBAction func StartGame(_ sender: AnyObject)
    {
        
        if (runForPlayer1 % 2 == 0 && runForPlayer2 % 2 == 0 || runForPlayer1 % 2 != 0 && runForPlayer2 % 2 != 0)
        {
            resultDraw = "Match Draw"
            player1Draw = player1.text!
            player2Draw = player2.text!
            flag1 = "1"
        }
        else if runForPlayer1 % 2 == 0
        {
            resultWon = player1.text!
            resultLoss = player2.text!
            flag1 = "0"
        }
        else if runForPlayer2 % 2 == 0
        {
            resultWon = player2.text!
            resultLoss = player1.text!
            flag1 = "0"
        }
        
        
        
//        if runForPlayer1 > runForPlayer2
//        {
//            resultWon = player1.text!
//            resultLoss = player2.text!
//            flag1 = "0"
//        }
//        else if runForPlayer1 < runForPlayer2
//        {
//            resultWon = player2.text!
//            resultLoss = player1.text!
//            flag1 = "0"
//        }
//        else
//        {
//            resultDraw = "Match Draw"
//            player1Draw = player1.text!
//            player2Draw = player2.text!
//            flag1 = "1"
//        }
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "Results"
        {
            let resultsVC = segue.destination as! ResultsViewController
            resultsVC.wonNameString = resultWon
            resultsVC.lossNameString = resultLoss
            resultsVC.drawNameString = resultDraw
            resultsVC.player1Draw = player1Draw
            resultsVC.player2Draw = player2Draw
            resultsVC.players = namePlayerAll
            resultsVC.flag = flag1
            let date = Date();
            let formatter = DateFormatter();
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss";
            let defaultTimeZoneStr = formatter.string(from: date);
            resultsVC.currentTime = defaultTimeZoneStr
        }
        
    }
    
    
    @IBAction func restartGameButtonTapped(_ sender: AnyObject)
    {
        player1.text = ""
        player2.text = ""
        messageLabel.text = "Select Players"
        StartButton.isEnabled = false
        StartButton.setTitleColor(UIColor.lightGray, for: UIControlState())
        namePlayer1 = namePlayerAll
        namePlayer2 = namePlayerAll
    }
}
