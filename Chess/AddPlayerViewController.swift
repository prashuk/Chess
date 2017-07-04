//
//  AddPlayerViewController.swift
//  Chess
//
//  Created by CTS BTP5NE18 on 8/1/16.
//  Copyright © 2016 CTS BTP5NE18. All rights reserved.
//

import UIKit

class AddPlayerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate, UITextViewDelegate
{
    var country = ["India", "Germany", "Australia", "France", "USA"]
    var players = [Player]()
    
    var flag = 0
    var flag1 = 0
    
    @IBOutlet weak var addPlayerName: UITextField!
    @IBOutlet weak var addPlayerAge: UITextField!
    @IBOutlet weak var addPlayerCountry: UITextField!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var addButton: UIButton!

    var buttonTitle = ""
    var nameEdit = ""
    var ageEdit = ""
    var countryEdit = ""
    
    @IBOutlet weak var ageLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        let picker: UIPickerView
        picker = UIPickerView(frame: CGRect(x: 0, y: 10, width: view.frame.width, height: 150))
        picker.backgroundColor = .white
        
        picker.showsSelectionIndicator = true
        picker.delegate = self
        picker.dataSource = self
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 9/255, green: 122/255, blue: 0/255, alpha: 1)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(AddPlayerViewController.donePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(AddPlayerViewController.cancelPicker))
        
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        addPlayerCountry.inputView = picker
        addPlayerCountry.inputAccessoryView = toolBar
        
        addPlayerCountry.delegate = self
        addPlayerName.delegate = self
        addPlayerAge.delegate = self
        
        addPlayerName.text = nameEdit
        addPlayerAge.text = ageEdit
        addPlayerCountry.text = countryEdit
        
        if flag1 == 1
        {
            addButton.setTitle(buttonTitle, for: UIControlState())
        }
    }

    @IBAction func resetButtonTapped(_ sender: AnyObject)
    {
        addPlayerName.text = ""
        addPlayerAge.text = ""
        addPlayerCountry.text = ""
        ageLabel.text = ""
    }
    @IBAction func addButtonTapped(_ sender: AnyObject)
    {
        if flag1 == 1
        {
            let characterset = CharacterSet(charactersIn: "0123456789")
            addPlayerName.text = condenseWhitespace(addPlayerName.text!)
            addPlayerAge.text = condenseWhitespaceForNumbers(addPlayerAge.text!)
            
            if (addPlayerName.text == "" || addPlayerAge.text == "" || addPlayerCountry.text == "")
            {
                let alert = UIAlertController(title: "Error", message: "Name/Age/Country cannot be empty", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
            }
            else if addPlayerAge.text!.rangeOfCharacter(from: characterset.inverted) != nil
            {
                ageLabel.text = "Please enter correct age!"
            }
            else if (addPlayerAge.text! >= String(15) && addPlayerAge.text! <= String(90))
            {
                ageLabel.text! = ""
                for data in players
                {
                    if data.playerName == addPlayerName.text
                    {
                        let alert = UIAlertController(title: "Player already in database", message: "Please give another name", preferredStyle: UIAlertControllerStyle.alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        present(alert, animated: true, completion: nil)
                        flag = 1
                        break
                    }
                    else
                    {
                        flag = 0
                    }
                }
                if flag == 0
                {
                    performSegue(withIdentifier: "done", sender: nil)
                }
                else
                {
                    
                }
            }
            else
            {
                ageLabel.text = "Age should be a number from 15 to 90"
            }
        }
        else
        {
            let characterset = CharacterSet(charactersIn: "0123456789")
            addPlayerName.text = condenseWhitespace(addPlayerName.text!)
            addPlayerAge.text = condenseWhitespaceForNumbers(addPlayerAge.text!)
            if (addPlayerName.text == "" || addPlayerAge.text == "" || addPlayerCountry.text == "")
            {
                let alert = UIAlertController(title: "Error", message: "Name/Age/Country cannot be empty", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
            }
            else if addPlayerAge.text!.rangeOfCharacter(from: characterset.inverted) != nil
            {
                ageLabel.text = "Please enter correct age!"
            }
            else if (addPlayerAge.text! >= String(15) && addPlayerAge.text! <= String(90))
            {
                ageLabel.text! = ""
                for data in players
                {
                    if data.playerName == addPlayerName.text
                    {
                        let alert = UIAlertController(title: "Player already in database", message: "Please give another name", preferredStyle: UIAlertControllerStyle.alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        present(alert, animated: true, completion: nil)
                        flag = 1
                        break
                    }
                    else
                    {
                        flag = 0
                    }
                }
                if flag == 0
                {
                    performSegue(withIdentifier: "addDetails", sender: nil)
                }
                else
                {
                    
                }
            }
            else
            {
                ageLabel.text = "Age should be a number from 15 to 90"
            }

        }
    }
    
    func condenseWhitespace(_ string: String) -> String
    {
        var array = [String]()
        array = string.characters.split {$0 == " "}.map(String.init)
        let str = array.joined(separator: " ")
        return str
    }
    func condenseWhitespaceForNumbers(_ string: String) -> String
    {
        var array = [String]()
        array = string.characters.split {$0 == " "}.map(String.init)
        let str = array.joined(separator: "")
        return str
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return country.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return country[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        addPlayerCountry.text = country[row]
    }
    
    func donePicker(_ pickerView: UIPickerView)
    {
        if addPlayerCountry.text == ""
        {
            addPlayerCountry.text = country[0]
        }
        addPlayerCountry.resignFirstResponder()
    }
    
    func cancelPicker(_ pickerView: UIPickerView)
    {
        addPlayerCountry.text = ""
        addPlayerCountry.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        addPlayerName.resignFirstResponder()
        addPlayerAge.resignFirstResponder()
        return true
    }    

}

