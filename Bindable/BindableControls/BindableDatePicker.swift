//
//  BindableDatePicker.swift
//  Bindable
//
//  Created by Florian MAFFINI on 25.11.18.
//  Copyright © 2018 Florian MAFFINI. All rights reserved.
//

import UIKit

open class BindableDatePicker: UIDatePicker, BindableControl {
    
    typealias BoundType = Date
    
    open var bindable: Bindable<Date>
    
    public init(_ bindable: Bindable<Date>) {
        self.bindable = bindable
        super.init(frame: .zero)
        self.addTarget(self, action: #selector(valueDidChange), for: .valueChanged)
    }
    
    override init(frame: CGRect) {
        self.bindable = Bindable<Date>(Date())
        super.init(frame: frame)
        self.addTarget(self, action: #selector(valueDidChange), for: .valueChanged)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        self.bindable = Bindable<Date>(Date())
        super.init(coder: aDecoder)
        self.addTarget(self, action: #selector(valueDidChange), for: .valueChanged)
    }
    
    @objc func valueDidChange(_ picker: UIDatePicker) {
        bindable.value = picker.date
    }
}

