//
//  ViewController.swift
//  SnuGoo
//
//  Created by Brian Marx on 1/30/17.
//  Copyright © 2017 Brian Marx. All rights reserved.
//

import UIKit

class OscFilterViewController: UIViewController {

    let model = OscFilterModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //MARK: Oscillator Switches
    @IBAction private func SawSwitch(_ sender: UISwitch) {
        print(sender.isOn)
//        if sender.isOn {
//            model.sawOsc.start()
//        } else {
//            model.sawOsc.stop()
//        }
    }
    
    @IBAction private func SquareSwitch(_ sender: UISwitch) {
        if sender.isOn {
            model.squareOsc.start()
        } else {
            model.squareOsc.stop()
        }
    }
    
    @IBAction private func SineSwitch(_ sender: UISwitch) {
        if sender.isOn {
            model.sineOsc.start()
        } else {
            model.sineOsc.stop()
        }
    }
    
    @IBAction private func TriangleSwitch(_ sender: UISwitch) {
        if sender.isOn {
            model.triangleOsc.start()
        } else {
            model.triangleOsc.stop()
        }
    }
    
    //MARK: Oscillator Segmented Control switches
    @IBAction private func SawSegmentedControl(_ sender: UISegmentedControl) {
        let m = multiplierSelector(multiplier: sender.selectedSegmentIndex)
        model.changeMultiplier(oscillatorType: 0, by: m)
    }
    
    @IBAction private func SquareSegmentedControl(_ sender: UISegmentedControl) {
        let m = multiplierSelector(multiplier: sender.selectedSegmentIndex)
        model.changeMultiplier(oscillatorType: 1, by: m)
    }
    
    @IBAction private func SineSegmentedControl(_ sender: UISegmentedControl) {
        let m = multiplierSelector(multiplier: sender.selectedSegmentIndex)
        model.changeMultiplier(oscillatorType: 2, by: m)
    }
    
    @IBAction private func TriangleSegmentedControl(_ sender: UISegmentedControl) {
        let m = multiplierSelector(multiplier: sender.selectedSegmentIndex)
        model.changeMultiplier(oscillatorType: 3, by: m)
    }
    
    func multiplierSelector(multiplier: Int) -> Double {
        switch multiplier {
            case 0: return 1
            case 1: return 1.5
            case 2: return 2
            default: break
        }
        return 1
    }
    
    //MARK: Filter Types
    @IBAction private func FilterSegmentedControl(_ sender: UISegmentedControl) {
        let filterChoice = sender.selectedSegmentIndex
        switch filterChoice {
        case 0: model.lowPassMixer.volume = 1.0
                model.bandPassMixer.volume = 0.0
                model.highPassMixer.volume = 0.0
            
        case 1: model.lowPassMixer.volume = 0.0
                model.bandPassMixer.volume = 1.0
                model.highPassMixer.volume = 0.0
            
        case 2: model.lowPassMixer.volume = 0.0
                model.bandPassMixer.volume = 0.0
                model.highPassMixer.volume = 1.0
        default: break
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



