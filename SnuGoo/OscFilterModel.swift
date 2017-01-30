//
//  OscFilterModal.swift
//  SnuGoo
//
//  Created by Brian Marx on 1/30/17.
//  Copyright © 2017 Brian Marx. All rights reserved.
//

import Foundation
import AudioKit

class OscFilterModel {
    
    //Oscillators
    var sawOsc = AKOscillator(waveform: AKTable(.sawtooth))
    var squareOsc = AKOscillator(waveform: AKTable(.square))
    var sineOsc = AKOscillator(waveform: AKTable(.sine))
    var triangleOsc = AKOscillator(waveform: AKTable(.triangle))
    var oscMixer = AKMixer()
    
    var mainOscFreq = 1000.0
    var mainFilterFreq = 1000.0
    
    //Filters
    var lowPass: AKLowPassFilter
    var lowPassMixer: AKMixer
    var bandPass: AKBandPassFilter
    var bandPassMixer: AKMixer
    var highPass: AKHighPassFilter
    var highPassMixer: AKMixer

    
    init() {
        
        oscMixer = AKMixer(sawOsc, squareOsc, sineOsc, triangleOsc)
        
        //Filter inits
        lowPass = AKLowPassFilter(oscMixer, cutoffFrequency: mainFilterFreq, resonance: 0.5)
        bandPass = AKBandPassFilter(oscMixer, centerFrequency: mainFilterFreq, bandwidth: 0.5)
        highPass = AKHighPassFilter(oscMixer, cutoffFrequency: mainFilterFreq, resonance: 0.5)
        
        //Filter Mixers
        lowPassMixer = AKMixer(lowPass)
        bandPassMixer = AKMixer(bandPass)
        highPassMixer = AKMixer(highPass)
        
    }
    
    private func adjustFilterFrequency(freq: Double) {
        mainFilterFreq = freq
        lowPass.cutoffFrequency = freq
        bandPass.centerFrequency = freq
        highPass.cutoffFrequency = freq
    }
    
    private func adjustOscFrequency(freq: Double) {
        mainOscFreq = freq
        sawOsc.frequency = freq
        squareOsc.frequency = freq
        sineOsc.frequency = freq
        triangleOsc.frequency = freq
    }
}
