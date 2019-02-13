//
//  ViewController.swift
//  bullseye
//
//  Created by Gabriel Wilk Mizrahi on 2/7/19.
//  Copyright © 2019 Gabriel Wilk Mizrahi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentValue: Int = 0
    var targetValue: Int = 0
    var score = 0
    var roundNum = 0
    
    @IBOutlet weak var slider: UISlider!
    
//    @IBOutlet weak var startNewGame: UILabel!
    
    @IBOutlet weak var targetLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        reset()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAlert() {
        
       
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        
        
        
        let title: String
        
        if difference == 0{
            title = "Perfect!"
            points += 100
        } else if difference < 5{
            title = "You almost had it"
            if difference == 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "not bad"
        } else {
            title = "not even close..."
        }
        
        score += points
        
        let message = "You scored \(points) points"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Awesome!", style: .default, handler: {
            action in
            self.startNewRound()
        })
        
        alert.addAction(action)
            present(alert, animated:true, completion: nil)
        
    }

    @IBAction func sliderMoved( slider: UISlider){
        print("The value of the slider is: \(slider.value)")
        let roundedValue = slider.value.rounded()
        print("The value of the slider is now: \(roundedValue)")
        currentValue = Int(roundedValue)
    }
    
//    @IBAction func startNewGame ( startNewGame: UILabel){
//        reset()
//    }
   
    func startNewRound(){
        roundNum += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        
        updateLabels()
    }
    
    func updateLabels(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(roundNum)
        
        
    }
    
    @IBAction func reset(){
        score = 0
        roundNum = 0
        startNewRound()
    }
}

