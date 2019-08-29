//
//  BindableTextField.swift
//  Bindable
//
//  Created by Florian MAFFINI on 25.11.18.
//  Copyright © 2018 Florian MAFFINI. All rights reserved.
//

import UIKit

open class BindableTextField: UITextField, BindableControl {
    
    typealias BoundType = String?
    
    open var bindable: Bindable<String?>
    
    public init(_ bindable: Bindable<String?>) {
        self.bindable = bindable
        super.init(frame: .zero)
        self.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
    
    override init(frame: CGRect) {
        self.bindable = Bindable<String?>("")
        super.init(frame: frame)
        self.addTarget(self, action: #selector(textDidChange), for: .valueChanged)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        self.bindable = Bindable<String?>("")
        super.init(coder: aDecoder)
        self.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
    
    @objc func textDidChange(_ textField: UITextField) {
        bindable.value = textField.text
    }
    
    
}

