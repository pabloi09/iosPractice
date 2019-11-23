//
//  FigureViewController.swift
//  PracticeProject
//
//  Created by Pablo Martín Redondo on 17/11/2019.
//  Copyright © 2019 Pablo Martín Redondo. All rights reserved.
//

import UIKit

class FigureViewController: UIViewController {
    
    @IBOutlet weak var scaleSlider: UISlider!
    var items : [PracticeItem]?
    var type : Int?
    @IBOutlet weak var figure: FigureView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var points : [CGPoint] = []
        if let pointItems = items {
            for item in pointItems {
                points.append(CGPoint(x: parseString(item.x), y: parseString(item.y)))
            }
        }
        figure.points = points
        figure.type = type!
        if type == 0 {
            scaleSlider.isHidden = true
        }
        
        
        
        // Do any additional setup after loading the view.
    }
    func parseString(_ value : String) -> Int{
        if(value == ""){
            return 0
        } else{
            return Int(value) ?? 0
        }
    }
    

    @IBAction func updateFV(_ sender: UISlider) {
        figure.scale = CGFloat(sender.value)
        figure.setNeedsDisplay()
    }
    
}
