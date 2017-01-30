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
    
    var mainMixer: AKMixer

    
    init() {
        
        oscMixer = AKMixer(sawOsc, squareOsc, sineOsc, triangleOsc)
        oscMixer.start()
        
        //Filter inits
        lowPass = AKLowPassFilter(oscMixer, cutoffFrequency: mainFilterFreq, resonance: 0.5)
        bandPass = AKBandPassFilter(oscMixer, centerFrequency: mainFilterFreq, bandwidth: 0.5)
        highPass = AKHighPassFilter(oscMixer, cutoffFrequency: mainFilterFreq, resonance: 0.5)
        
        //Filter Mixers
        lowPassMixer = AKMixer(lowPass)
        lowPassMixer.start()
        bandPassMixer = AKMixer(bandPass)
        bandPassMixer.start()
        highPassMixer = AKMixer(highPass)
        highPassMixer.start()
        
        mainMixer = AKMixer(lowPassMixer, bandPassMixer, highPassMixer)
        mainMixer.start()
        AudioKit.output = mainMixer
        AudioKit.start()
        
    }
    
    func adjustFilterFrequency(freq: Double) {
        mainFilterFreq = freq
        lowPass.cutoffFrequency = freq
        bandPass.centerFrequency = freq
        highPass.cutoffFrequency = freq
    }
    
    func adjustOscFrequency(freq: Double) {
        mainOscFreq = freq
        sawOsc.frequency = freq
        squareOsc.frequency = freq
        sineOsc.frequency = freq
        triangleOsc.frequency = freq
    }
    
    
}

/*
func turnOnSawOsc() {
    sawOsc.start()
}

func turnOffSawOsc() {
    sawOsc.stop()
}

func turnOnSquareOsc() {
    squareOsc.start()
}

func turnOnSineOsc() {
    sineOsc.start()
}

func turnOffSineOsc() {
    sineOsc.stop()
}

func turnOnTriangleOsc() {
    triangleOsc.start()
}

func turnOffTriangleOsc() {
    triangleOsc.stop()
}*/
