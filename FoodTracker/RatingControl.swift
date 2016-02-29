//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Logan on 2/21/16.
//  Copyright © 2016 Logan. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    
    //MARK: Properties
    var rating = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    let spacing = 5
    let stars = 5
    
    
    var ratingButtons = [UIButton]()
    
    override func intrinsicContentSize() -> CGSize {
        
        let buttonSize = Int(frame.size.height)
       
        
        let width = (buttonSize * spacing) * stars
        
        return CGSize(width: width, height: buttonSize)
    }
    
    //MARK: Initialization
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let filledStarImage = UIImage(named: "filledStar")
        let emptyStarImage = UIImage(named: "emptyStar")
        
        for _ in 0..<stars {
            
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
            
            
            button.setImage(emptyStarImage, forState: .Normal)
            button.setImage(filledStarImage, forState: .Selected)
            button.setImage(filledStarImage, forState: [.Highlighted, .Selected])
            
            button.adjustsImageWhenHighlighted = false
            
            button.addTarget(self, action: "ratingButtonTapped:", forControlEvents: .TouchDown)
            
            ratingButtons += [button]
            addSubview(button)
        }
        
    }
    
    override func layoutSubviews() {
        
        let buttonSize = Int(frame.size.height)
        
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        // Offset each button's origin by the length of the button plus spacing.
        for (index, button) in ratingButtons.enumerate(){
            buttonFrame.origin.x = CGFloat(index * (buttonSize + 5))
            button.frame = buttonFrame
            
        }
        
        updateButtonSelectedStates()
    }
    
    
    //MARK: Button Action
    
    func ratingButtonTapped(button: UIButton){
        rating = ratingButtons.indexOf(button)! + 1
        
        updateButtonSelectedStates()
    }
    
    func updateButtonSelectedStates(){
        
        for (index, button) in ratingButtons.enumerate(){
            button.selected = index < rating
        }
    }
    
    
}
