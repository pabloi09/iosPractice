//
//  FigureView.swift
//  PracticeProject
//
//  Created by Pablo Martín Redondo on 17/11/2019.
//  Copyright © 2019 Pablo Martín Redondo. All rights reserved.
//

import UIKit

class FigureView: UIView {
    var scale : CGFloat = 1.0
    var points : [CGPoint] = [CGPoint(x: 0, y: 0)]
    var type = 0
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        switch type {
            case 0:
                drawWhatWritten(rect)
            case 1:
                drawWithPercentages(rect)
            default:
                drawWhatWritten(rect)
        }
        

        
    }
    
    func drawWhatWritten(_ rect : CGRect){
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
    
    // Dibujar cuadrado en el centro 75 %
    func drawWithPercentages(_ rect : CGRect){
        let w = bounds.size.width
        let h = bounds.size.height
        
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: scale * w/4, y: scale * h/4))
        path.addLine(to: CGPoint(x: scale * w/4, y: scale * 3*h/4))
        path.addLine(to: CGPoint(x: scale * 3*w/4, y: scale * 3*h/4))
        path.addLine(to: CGPoint(x: scale * 3*w/4, y: scale * h/4))
        
        path.close()
        
        UIColor.red.setStroke()
        UIColor.blue.setFill()
        
        path.lineWidth = 5
        
        path.stroke()
        path.fill()
    }
    
    

}
