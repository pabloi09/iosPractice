//
//  FigureView.swift
//  PracticeProject
//
//  Created by Pablo Martín Redondo on 17/11/2019.
//  Copyright © 2019 Pablo Martín Redondo. All rights reserved.
//

import UIKit

class FigureView: UIView {
    
    var points : [CGPoint] = [CGPoint(x: 0, y: 0)]
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        
        path.move(to: points[0])
        if(points.count > 1){
            for index in 1...(points.count - 1)  {
                path.addLine(to: points[index])
            }
        }
        if(points.count > 2){
            path.close()
            UIColor.yellow.setFill()
            path.fill()
        }
        
        UIColor.red.setStroke()
        path.lineWidth = 2
        path.stroke()
        
    }
    
    

}
