//
//  ViewController.swift
//  FindFlag
//
//  Created by Sreenivas k on 17/05/21.
//

import UIKit

class ViewController: UIViewController {
    var countries = [String]()
    var score  = 0
    var answer = ""
    var status = ""
    var ran = 0
    var counter = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        countries.append("estonia")
        countries.append("france")
        countries.append("germany")
        countries.append("ireland")
        countries.append("italy")
        countries.append("monaco")
        countries.append("nigeria")
        countries.append("poland")
        countries.append("russia")
        countries.append("spain")
        countries.append("uk")
        countries.append("us")
        
        
        
        
        startGame()
        image0.layer.borderWidth=1.0
        image1.layer.borderWidth=1.0
        image2.layer.borderWidth=1.0
        
    }
    @IBOutlet weak var image0: UIButton!
    @IBOutlet weak var image1: UIButton!
    @IBOutlet weak var image2: UIButton!
    
    func startGame(action:UIAlertAction! = nil){
        countries.shuffle()
        image0.setImage(UIImage(named: countries[0]), for: .normal)
        image1.setImage(UIImage(named: countries[1]), for: .normal)
        image2.setImage(UIImage(named: countries[2]), for: .normal)
      
        ran = Int.random(in: 0...2)
        answer = countries[ran]
        title = answer.uppercased()
    }
    
    @IBAction func BtnPressed(_ sender: UIButton) {
        counter+=1
        print(sender.tag)
        print(ran)
        if ran == sender.tag{
            print("Winner")
            score+=1
            status = "Corrent"
        }else{
            status = "Wrong"
            score-=1
        }
        if counter == 10{
            var ar = UIAlertController(title:status , message: "Your score is \(score) and Game Completed ", preferredStyle: .alert)
            ar.addAction(UIAlertAction(title: "Reset", style: .default, handler: startGame))
            present(ar, animated: true)
            score=0
            counter=0
        }else{
        var ar = UIAlertController(title:status , message: "Your score is \(score)", preferredStyle: .alert)
        ar.addAction(UIAlertAction(title: "Continue", style: .default, handler: startGame))
            present(ar, animated: true)
        }
        
    }
}

