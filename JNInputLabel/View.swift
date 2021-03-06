//
//  View.swift
//  JNInputLabel
//
//  Created by Joey Nelson on 7/5/16.
//  Copyright © 2016 Joey Nelson. All rights reserved.
//

import UIKit

class View: UIView {
    
    // MARK: Properties
    let char = InputLabel()
    
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
        self.backgroundColor = UIColor.whiteColor()
        
        addSubview(char)
    }
    
    func applyConstraints() {
        char.addConstraints(
            Constraint.llrr.of(self, offset: 30),
            Constraint.cycy.of(self),
            Constraint.h.of(50)
        )
    }
}