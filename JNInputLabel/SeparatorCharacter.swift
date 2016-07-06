//
//  SeparatorCharacter.swift
//  JNInputLabel
//
//  Created by Joey Nelson on 7/6/16.
//  Copyright © 2016 Joey Nelson. All rights reserved.
//

import UIKit

class SeparatorCharacter : UIView {
    
    // MARK: Properties
    let character = UILabel()
    
    internal var characterSize: CGFloat = 18
    
    // MARK: Inits
    convenience init() {
        self.init(frame: CGRectZero)
    }
    
    convenience init(textAlignment: NSTextAlignment, char: String, font: UIFont, size: CGFloat) {
        self.init()
        character.textAlignment = textAlignment
        character.text = char
        character.font = font
        characterSize = size
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
        addSubview(character)
    }
    
    func applyConstraints() {
        character.addConstraints(
            Constraint.cxcx.of(self),
            Constraint.cycy.of(self),
            Constraint.h.of(characterSize),
            Constraint.w.of(characterSize)
        )
    }
}