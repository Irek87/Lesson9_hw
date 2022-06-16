//
//  ViewController.swift
//  Lesson9_hw
//
//  Created by Reek i on 06.06.2022.
//

import Spring

class ViewController: UIViewController {

    @IBOutlet var springAnimationView: SpringView!
    @IBOutlet var springAnimationParametersLabel: UILabel!
    
//    private let animationPresetsArray = ["shake", "pop", "morph", "wobble", "swing"]
//    private let curvesArray = ["easeIn", "easeOut", "easeInOut", "linear"]
    
    var randomParameter: AnimationParameters!
    let randomPreset = Spring.AnimationPreset.allCases.randomElement()?.rawValue
//    let randomCurve = Spring.AnimationCurve.allCases.randomElement()?.rawValue
    
//    randomParameter.preset = springAnimationView.animation.randomElement() ?? ""
//    randomParameter.preset = Spring.AnimationPreset.allCases.randomElement().rawValue
//    randomParameter.preset = randomPreset
//    randomParameter.curve = curvesArray.randomElement() ?? ""
//    randomParameter.force = Float.random(in: 1...2)
//    randomParameter.duration = Float.random(in: 1...3)
//    randomParameter.delay = Float.random(in: 0.1...1.5)
    
    @IBAction func runSpringAnimation(_ sender: SpringButton) {
        if sender.currentTitle == nil {
            springAnimationView.animation = randomPreset ?? "pop"
            springAnimationView.curve = Spring.AnimationCurve.allCases.randomElement()?.rawValue ?? "easyIn"
            springAnimationView.force = CGFloat.random(in: 1...2)
            springAnimationView.duration = CGFloat.random(in: 1...3)
            springAnimationView.delay = CGFloat.random(in: 0.1...1.5)
            springAnimationView.animate()
        
            sender.setTitle(Spring.AnimationPreset.allCases.randomElement()?.rawValue, for: .normal)
        } else {
            springAnimationView.animation = sender.currentTitle ?? "pop"
//            springAnimationView.animation = randomParameter.preset
            springAnimationView.curve = Spring.AnimationCurve.allCases.randomElement()?.rawValue ?? "easyIn"
            springAnimationView.force = CGFloat.random(in: 1...2)
            springAnimationView.duration = CGFloat.random(in: 1...3)
            springAnimationView.delay = CGFloat.random(in: 0.1...1.5)
            springAnimationView.animate()
            
            sender.setTitle(Spring.AnimationPreset.allCases.randomElement()?.rawValue, for: .normal)
        }
        
        springAnimationParametersLabel.text = "Preset: \(springAnimationView.animation) \n Curve: \(springAnimationView.curve) \n force: \(round(100 * springAnimationView.force) / 100) \n duration: \(round(100 * springAnimationView.duration) / 100) \n delay: \(round( 100 * springAnimationView.delay) / 100)"
    }
}

