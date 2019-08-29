//
//  BindableSwitch.swift
//  Bindable
//
//  Created by Florian MAFFINI on 25.11.18.
//  Copyright © 2018 Florian MAFFINI. All rights reserved.
//

import UIKit

open class BindableSwitch: UISwitch, BindableControl {
    
    typealias BoundType = Bool
    
    open var bindable: Bindable<Bool>
    
    public init(_ bindable: Bindable<Bool>) {
        self.bindable = bindable
        super.init(frame: .zero)
        self.addTarget(self, action: #selector(valueDidChange), for: .valueChanged)
    }
    
    override init(frame: CGRect) {
        self.bindable = Bindable<Bool>(false)
        super.init(frame: frame)
        self.addTarget(self, action: #selector(valueDidChange), for: .valueChanged)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        self.bindable = Bindable<Bool>(false)
        super.init(coder: aDecoder)
        self.addTarget(self, action: #selector(valueDidChange), for: .valueChanged)
    }
    
    @objc func valueDidChange(_ toggle: UISwitch) {
        bindable.value = toggle.isOn
    }
}
