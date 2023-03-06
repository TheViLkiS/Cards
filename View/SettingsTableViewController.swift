//
//  SettingsTableViewController.swift
//  Cards
//
//  Created by Дмитрий Гусев on 22.12.2022.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    var storage = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // хранилище данных
        
        segmentedControl.selectedSegmentIndex = (storage.object(forKey: "segmentedControl") as? Int) ?? 0
        
        colorRed.isOn = (storage.object(forKey: "red") as? Bool) ?? true
        colorBlack.isOn = (storage.object(forKey: "black") as? Bool) ?? true
        colorBrown.isOn = (storage.object(forKey: "brown") as? Bool) ?? true
        colorPurple.isOn = (storage.object(forKey: "purple") as? Bool) ?? true
        colorGreen.isOn = (storage.object(forKey: "green") as? Bool) ?? true
        colorGrey.isOn = (storage.object(forKey: "gray") as? Bool) ?? true
        colorYellow.isOn = (storage.object(forKey: "yellow") as? Bool) ?? true
        colorOrange.isOn = (storage.object(forKey: "orange") as? Bool) ?? true
        
        settingCircle.isOn = (storage.object(forKey: "circle") as? Bool) ?? true
        settingCircleNoColor.isOn = (storage.object(forKey: "circleNoColor") as? Bool) ?? true
        settingSquare.isOn = (storage.object(forKey: "square") as? Bool) ?? true
        settingRectangle.isOn = (storage.object(forKey: "cross") as? Bool) ?? true
        settingLine.isOn = (storage.object(forKey: "fill") as? Bool) ?? true
        
        settingBackSideCircle.isOn = (storage.object(forKey: "settingBackSideCircle") as? Bool) ?? true
        settingBackSideLine.isOn = (storage.object(forKey: "settingBackSideLine") as? Bool) ?? true
        
        
    }
    
    
    @IBOutlet var colorRed: UISwitch!
    @IBAction func colorRedSwitch(){
        storage.set(colorRed.isOn, forKey: "red")
        colorRed.isOn = storage.object(forKey: "red") as! Bool
    }
    @IBOutlet var colorBlack: UISwitch!
    @IBAction func colorBlackSwitch(){
        storage.set(colorBlack.isOn, forKey: "black")
        colorBlack.isOn = storage.object(forKey: "black") as! Bool
    }
    @IBOutlet var colorBrown: UISwitch!
    @IBAction func colorBrownSwitch(){
        storage.set(colorBrown.isOn, forKey: "brown")
        colorBrown.isOn = storage.object(forKey: "brown") as! Bool
    }
    @IBOutlet var colorPurple: UISwitch!
    @IBAction func colorPurpleSwitch(){
        storage.set(colorPurple.isOn, forKey: "purple")
        colorPurple.isOn = storage.object(forKey: "purple") as! Bool
    }
    @IBOutlet var colorGreen: UISwitch!
    @IBAction func colorGreenSwitch(){
        storage.set(colorGreen.isOn, forKey: "green")
        colorGreen.isOn = storage.object(forKey: "green") as! Bool
    }
    @IBOutlet var colorGrey: UISwitch!
    @IBAction func colorGreySwitch(){
        storage.set(colorGrey.isOn, forKey: "gray")
        colorGrey.isOn = storage.object(forKey: "gray") as! Bool
    }
    @IBOutlet var colorYellow: UISwitch!
    @IBAction func colorYellowSwitch(){
        storage.set(colorYellow.isOn, forKey: "yellow")
        colorYellow.isOn = storage.object(forKey: "yellow") as! Bool
    }
    @IBOutlet var colorOrange: UISwitch!
    @IBAction func colorOrangeSwitch(){
        storage.set(colorOrange.isOn, forKey: "orange")
        colorOrange.isOn = storage.object(forKey: "orange") as! Bool
    }

    
    @IBOutlet var settingCircle: UISwitch!
    @IBAction func settingCircleSwitch() {
        storage.set(settingCircle.isOn, forKey: "circle")
        settingCircle.isOn = storage.object(forKey: "circle") as! Bool
    }
    @IBOutlet var settingCircleNoColor: UISwitch!
    @IBAction func settingCircleNoColorSwitch() {
        storage.set(settingCircleNoColor.isOn, forKey: "circleNoColor")
        settingCircleNoColor.isOn = storage.object(forKey: "circleNoColor") as! Bool
    }
    @IBOutlet var settingSquare: UISwitch!
    @IBAction func settingSquareSwitch() {
        storage.set(settingSquare.isOn, forKey: "square")
        settingSquare.isOn = storage.object(forKey: "square") as! Bool
    }
    @IBOutlet var settingRectangle: UISwitch!
    @IBAction func settingRectangleSwitch() {
        storage.set(settingRectangle.isOn, forKey: "cross")
        settingRectangle.isOn = storage.object(forKey: "cross") as! Bool
    }
    @IBOutlet var settingLine: UISwitch!
    @IBAction func settingLineSwitch() {
        storage.set(settingLine.isOn, forKey: "fill")
        settingLine.isOn = storage.object(forKey: "fill") as! Bool
    }
   
    @IBOutlet var settingBackSideCircle: UISwitch!
    @IBAction func settingBackSideCircleSwitch() {
        storage.set(settingBackSideCircle.isOn, forKey: "settingBackSideCircle")
        settingBackSideCircle.isOn = storage.object(forKey: "settingBackSideCircle") as! Bool
    }
    @IBOutlet var settingBackSideLine: UISwitch!
    @IBAction func settingBackSideLineSwitch() {
        storage.set(settingBackSideLine.isOn, forKey: "settingBackSideLine")
        settingBackSideLine.isOn = storage.object(forKey: "settingBackSideLine") as! Bool
    }
    
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBAction func segmentedControlSwitch() {
        storage.set(segmentedControl.selectedSegmentIndex, forKey: "segmentedControl")
        
    }
    
}
