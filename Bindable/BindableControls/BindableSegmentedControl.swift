//
//  BindableSegmentedControl.swift
//  Bindable
//
//  Created by Florian MAFFINI on 25.11.18.
//  Copyright © 2018 Florian MAFFINI. All rights reserved.
//

import UIKit

open class BindableSegmentedControl: UISegmentedControl, BindableControl {
    
    typealias BoundType = Int
    
    open var bindable: Bindable<Int>
    
    public init(_ bindable: Bindable<Int>) {
        self.bindable = bindable
        super.init(frame: .zero)
        self.addTarget(self, action: #selector(valueDidChange), for: .valueChanged)
    }
    
    override init(frame: CGRect) {
        self.bindable = Bindable<Int>(0)
        super.init(frame: frame)
        self.addTarget(self, action: #selector(valueDidChange), for: .valueChanged)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        self.bindable = Bindable<Int>(0)
        super.init(coder: aDecoder)
        self.addTarget(self, action: #selector(valueDidChange), for: .valueChanged)
    }
    
    @objc func valueDidChange(_ control: UISegmentedControl) {
        bindable.value = control.selectedSegmentIndex
    }
}
