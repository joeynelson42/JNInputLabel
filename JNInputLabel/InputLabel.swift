//
//  InputLabel.swift
//  JNInputLabel
//
//  Created by Joey Nelson on 7/5/16.
//  Copyright © 2016 Joey Nelson. All rights reserved.
//

struct Constants {
    
    struct Metrics {
        static let screenWidth = UIScreen.mainScreen().bounds.width
        static let screenHeight = UIScreen.mainScreen().bounds.height
    }
    
    struct Keys {
        static let UserFirstName = "FirstName"
        static let UserLastName = "LastName"
        static let UserID = "UserID"
    }
}

import UIKit

class InputLabel : UIView {
    
    // MARK: Properties
    var currentInput: String = ""
    var stackViewContainer = UIStackView()
    var inputCharacters = [InputCharacter]()
    
    /// Format for the label. Each "0" is an InputCharacter, "-", "/", ")", "(" will appear as they are
    internal var inputFormat = "(000)000-0000"
    
    /// Dynamically sized based on screen size
    internal var characterSize: CGFloat = 0
    
    internal var font = UIFont(name: "Avenir", size: 18)
    
    // MARK: Inits
    convenience init() {
        self.init(frame: CGRectZero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setNeedsUpdateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Methods
    override func updateConstraints() {
        super.updateConstraints()
        configureSubviews()
        applyConstraints()
    }
    
    func configureSubviews() {
        stackViewContainer.axis = .Horizontal
        stackViewContainer.distribution = .EqualCentering
        stackViewContainer.alignment = .FirstBaseline
        stackViewContainer.spacing = 0
        
        for i in 0...inputFormat.characters.count - 1 {
            let index = inputFormat.startIndex.advancedBy(i)
            let char = inputFormat.characters[index]

            switch char {
            case "0":
                let newInput = constructInputChar()
                stackViewContainer.addArrangedSubview(newInput)
            case "/":
                let newSep = constructSeparatorChar("/", textAlign: .Center)
                stackViewContainer.addArrangedSubview(newSep)
            case "-":
                let newSep = constructSeparatorChar("-", textAlign: .Center)
                stackViewContainer.addArrangedSubview(newSep)
            case ")":
                let newSep = constructSeparatorChar(")", textAlign: .Left)
                stackViewContainer.addArrangedSubview(newSep)
            case "(":
                let newSep = constructSeparatorChar("(", textAlign: .Right)
                stackViewContainer.addArrangedSubview(newSep)
            default:
                break
            }
        }
        
        addSubview(stackViewContainer)
    }
    
    func applyConstraints() {
        stackViewContainer.addConstraints(
            Constraint.cycy.of(self),
            Constraint.llrr.of(self),
            Constraint.h.of(50)
        )
    }
    
    func characterSizeForScreenWidth() -> CGFloat {
        let inputLength = inputFormat.characters.count
        return Constants.Metrics.screenWidth / CGFloat(inputLength)
    }
    
    func constructInputChar() -> InputCharacter{
        let input = InputCharacter()
        input.character.text = "0"
        input.underline.backgroundColor = UIColor.blueColor()
        return input
    }
    
    func constructSeparatorChar(char: String, textAlign: NSTextAlignment) -> SeparatorCharacter {
        let newSeparator = SeparatorCharacter(textAlignment: textAlign, char: char, font: self.font!, size: characterSizeForScreenWidth())
        return newSeparator
    }
}
