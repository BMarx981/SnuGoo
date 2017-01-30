//
//  ViewController.swift
//  SnuGoo
//
//  Created by Brian Marx on 1/30/17.
//  Copyright © 2017 Brian Marx. All rights reserved.
//

import UIKit


class OscFilterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //MARK: Oscillator Switches
    @IBAction private func SawSwitch(_ sender: UISwitch) {
        if sender.isOn {
            OscFilterModel.sawOsc.start()
        } else {
            OscFilterModel.sawOsc.stop()
        }
    }
    
    @IBAction private func SquareSwitch(_ sender: UISwitch) {
        if sender.isOn {
            OscFilterModel.squareOsc.start()
        } else {
            OscFilterModel.squareOsc.stop()
        }
    }
    
    @IBAction private func SineSwitch(_ sender: UISwitch) {
        if sender.isOn {
            OscFilterModel.sineOsc.start()
        } else {
            OscFilterModel.sineOsc.stop()
        }
    }
    
    @IBAction private func TriangleSwitch(_ sender: UISwitch) {
        if sender.isOn {
            OscFilterModel.triangleOsc.start()
        } else {
            OscFilterModel.triangleOsc.stop()
        }
    }
    
    //MARK: Oscillator Segmented Control switches
    @IBAction private func SawSegmentedControl(_ sender: UISegmentedControl) {
        
    }
    
    @IBAction private func SquareSegmentedControl(_ sender: UISegmentedControl) {
        
    }
    
    @IBAction private func SineSegmentedControl(_ sender: UISegmentedControl) {
        
    }
    
    @IBAction private func TriangleSegmentedControl(_ sender: UISegmentedControl) {
        
    }
    
    //MARK: Filter Types
    @IBAction private func FilterSegmentedControl(_ sender: UISegmentedControl) {
        let filterChoice = sender.selectedSegementIndex
        switch filterChoice {
        case 0: OscFilterModel.lowPassMixer.amplitude = 1.0
        OscFilterModel.bandPassMxer.amplitude = 0.0
        OscFilterModel.highPassMixer.amplitude = 0.0
            
        case 1: OscFilterModel.lowPassMixer.amplitude = 0.0
        OscFilterModel.bandPassMxer.amplitude = 1.0
        OscFilterModel.highPassMixer.amplitude = 0.0
            
        case 2: OscFilterModel.lowPassMixer.amplitude = 0.0
        OscFilterModel.bandPassMxer.amplitude = 0.0
        OscFilterModel.highPassMixer.amplitude = 1.0
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

