//
//  InputCharacter.swift
//  JNInputLabel
//
//  Created by Joey Nelson on 7/5/16.
//  Copyright © 2016 Joey Nelson. All rights reserved.
//

import UIKit

class InputCharacter : UIView {
    
    // MARK: Properties
    let character = UILabel()
    let underline = UIView()
    
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
    
    func configureSubviews(){
        underline.backgroundColor = UIColor.grayColor()
        
        addSubview(character)
        addSubview(underline)
    }
    
    func applyConstraints() {
        
    }
}