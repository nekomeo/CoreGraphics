//
//  PushButtonView.swift
//  Flo
//
//  Created by Elle Ti on 2017-09-05.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

import UIKit

@IBDesignable // Makes it possible for you to see the '+' button without running

class PushButtonView: UIButton {
    
    @IBInspectable var fillColor: UIColor = UIColor.green
    @IBInspectable var isAddButton: Bool = true

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        fillColor.setFill()
        path.fill()
        
        // Set up the width and height variables for the horizontal stroke
        let plusHeight: CGFloat = 3.0
        let plusWidth: CGFloat = min(bounds.width, bounds.height) * 0.6
        
        // Create the path
        let plusPath = UIBezierPath()
        
        // Set the path's line width to the height of the stroke
        plusPath.lineWidth = plusHeight
        
        // Move the initial point of the path to the start of the horizontal stroke
        plusPath.move(to: CGPoint(x:bounds.width/2 - plusWidth/2 + 0.5, y:bounds.height/2 + 0.5))
        
        // Add a point to the path at the end of the stroke
        plusPath.addLine(to: CGPoint(x:bounds.width/2 + plusWidth/2 + 0.5, y:bounds.height/2 + 0.5))

            // Vertical line
        if isAddButton {
            // Move to the start of the vertical stroke
            plusPath.move(to: CGPoint(x:bounds.width/2 + 0.5, y:bounds.height/2 - plusWidth/2 + 0.5))
            
            // Add the end point to the vertical stroke
            plusPath.addLine(to: CGPoint(x:bounds.width/2 + 0.5, y:bounds.height/2 + plusWidth/2 + 0.5))
        }
        
        // Set the stroke color
        UIColor.white.setStroke()
        
        // Draw the stroke
        plusPath.stroke()
    }

}
