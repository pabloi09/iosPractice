//
//  FigureViewController.swift
//  PracticeProject
//
//  Created by Pablo Martín Redondo on 17/11/2019.
//  Copyright © 2019 Pablo Martín Redondo. All rights reserved.
//

import UIKit

class FigureViewController: UIViewController {
    
    var items : [PracticeItem]?
    
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
        
        
        
        // Do any additional setup after loading the view.
    }
    func parseString(_ value : String) -> Int{
        if(value == ""){
            return 0
        } else{
            return Int(value) ?? 0
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
