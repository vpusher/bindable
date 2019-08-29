//
//  BindableStepper.swift
//  Bindable
//
//  Created by Florian MAFFINI on 25.11.18.
//  Copyright © 2018 Florian MAFFINI. All rights reserved.
//

import UIKit

open class BindableStepper: UIStepper, BindableControl {
    
    typealias BoundType = Double
    
    open var bindable: Bindable<Double>
    
    public init(_ bindable: Bindable<Double>) {
        self.bindable = bindable
        super.init(frame: .zero)
        self.addTarget(self, action: #selector(valueDidChange), for: .valueChanged)
    }
    
    override init(frame: CGRect) {
        self.bindable = Bindable<Double>(0)
        super.init(frame: frame)
        self.addTarget(self, action: #selector(valueDidChange), for: .valueChanged)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        self.bindable = Bindable<Double>(0)
        super.init(coder: aDecoder)
        self.addTarget(self, action: #selector(valueDidChange), for: .valueChanged)
    }
    
    @objc func valueDidChange(_ stepper: UIStepper) {
        bindable.value = stepper.value
    }
}
