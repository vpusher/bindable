//
//  BindableSlider.swift
//  Bindable
//
//  Created by Florian MAFFINI on 25.11.18.
//  Copyright © 2018 Florian MAFFINI. All rights reserved.
//

import UIKit

open class BindableSlider: UISlider, BindableControl {
    
    typealias BoundType = Float
    
    open var bindable: Bindable<Float>
    
    public init(_ bindable: Bindable<Float>) {
        self.bindable = bindable
        super.init(frame: .zero)
        self.addTarget(self, action: #selector(valueDidChange), for: .valueChanged)
    }
    
    override init(frame: CGRect) {
        self.bindable = Bindable<Float>(0)
        super.init(frame: frame)
        self.addTarget(self, action: #selector(valueDidChange), for: .valueChanged)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        self.bindable = Bindable<Float>(0)
        super.init(coder: aDecoder)
        self.addTarget(self, action: #selector(valueDidChange), for: .valueChanged)
    }
    
    @objc func valueDidChange(_ slider: UISlider) {
        bindable.value = slider.value
    }
}
