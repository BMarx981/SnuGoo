//
//  OscFilterModal.swift
//  SnuGoo
//
//  Created by Brian Marx on 1/30/17.
//  Copyright © 2017 Brian Marx. All rights reserved.
//

import Foundation
import AudioKit

class OscFilterModal {
    
    //Oscillators
    let sawOsc = AKOscillator(waveform: AKTable(.sawtooth))
    let squareOsc = AKOscillator(waveform: AKTable(.square))
    let sineOsc = AKOscillator(waveform: AKTable(.sine))
    let triangleOsc = AKOscillator(waveform: AKTable(.triangle))
    
    let oscMixer = AKMixer(sawOsc, squareOsc, sineOsc, triangleOsc)
    
    //Filters
    let lowPass = AKLowPassFilter(oscMixer, cutoffFrequency: 1000, resonance: 0.5)?
    let bandPass = AKBandPassFilter(oscMixer, centerFrequency: 1000, bandwidth: 0.5)
    let highPass = AKHighPassFilter(oscMixer, cutoffFrequency: 1000, resonance: 0.5)
}
