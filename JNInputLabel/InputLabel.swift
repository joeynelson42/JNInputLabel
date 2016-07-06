//
//  InputLabel.swift
//  JNInputLabel
//
//  Created by Joey Nelson on 7/5/16.
//  Copyright © 2016 Joey Nelson. All rights reserved.
//

import UIKit

class InputLabel : UIView {
    
    // MARK: Properties
    var currentInput: String = ""
    var inputCharacters = [InputCharacter]()
    
    internal var inputLength: Int = 10
    internal var characterSize: CGFloat = 18
    
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
        for _ in 1...inputLength {
            let newInput = InputCharacter()
            newInput.character.text = "0"
            newInput.underline.backgroundColor = UIColor.blueColor()
            inputCharacters.append(newInput)
        }
    }
    
    func applyConstraints() {
        for (index, input) in inputCharacters.enumerate() {
            addSubview(input)
            input.addConstraints(
                Constraint.cycy.of(self),
                Constraint.ll.of(self, offset: CGFloat(index) * characterSize),
                Constraint.wh.of(characterSize)
            )
        }
    }
}
