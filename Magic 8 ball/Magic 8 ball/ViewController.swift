//
//  ViewController.swift
//  Magic 8 ball
//
//  Created by Julio Adrian Peña Romero on 1/15/18.
//  Copyright © 2018 Julio Adrian Peña Romero. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var ballArray : Array = ["ball1", "ball2", "ball3", "ball4", "ball5"]
    
    var randomBallNumber : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.newBallImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func askButtonPressed(_ sender: Any) {
        self.rotate()
        //self.newBallImage()
    }
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        self.rotate()
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        self.rotate()
    }
    
    func newBallImage(){
        self.randomBallNumber = Int(arc4random_uniform(4))
        self.imageView.image = UIImage(named : ballArray[randomBallNumber])
    }
    
    func rotate(){
        UIView.animate(withDuration: 1.0,
            animations: {
                //self.imageView.transform = CGAffineTransform(rotationAngle: (180.0 * .pi) / 180.0)
                self.rotate360()
            },
            completion: { (finished: Bool) in
                self.newBallImage()
            })
    }
    
    func rotate360(){
        self.imageView.transform = self.imageView.transform.rotated(by: .pi)
        self.imageView.transform = self.imageView.transform.rotated(by: .pi)
    }
}

