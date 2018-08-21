//
//  ViewController.swift
//  Jeu de dés
//
//  Created by Snoopy on 21/08/2018.
//  Copyright © 2018 EMANET. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var de: UIImageView!
    @IBOutlet weak var dede: UIImageView!
    
    var isShaking = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if !isShaking {
            if motion == .motionShake {
                self.isShaking = true
                var timer = Timer()
                var nombreDeTours = 0
                timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true, block: { (t) in
                    if nombreDeTours > 10 {
                        timer.invalidate()
                        self.isShaking = false
                    } else {
                        self.de.image = self.imageAleatoire()
                        self.dede.image = self.imageAleatoire()
                        nombreDeTours += 1
                    }
                })
            }
        }
    }
    
    func imageAleatoire() -> UIImage{
        let aleatoire = Int(arc4random_uniform(6)) + 1
        let aleatoireString = String(aleatoire)
        if let img = UIImage(named: aleatoireString) {
            return img
        } else {
            return UIImage(named: "1")!
        }
    }

}

