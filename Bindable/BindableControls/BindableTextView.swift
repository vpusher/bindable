//
//  BindableTextField.swift
//  Bindable
//
//  Created by Florian MAFFINI on 25.11.18.
//  Copyright © 2018 Florian MAFFINI. All rights reserved.
//

import UIKit

open class BindableTextView: UITextView, BindableControl {
    
    typealias BoundType = String?
    
    open var bindable: Bindable<String?>
    
    override open var delegate: UITextViewDelegate? {
        didSet {
            swizzleMethod()
        }
    }
    
    public init(_ bindable: Bindable<String?>) {
        self.bindable = bindable
        super.init(frame: .zero, textContainer: nil)
    }
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        self.bindable = Bindable<String?>(nil)
        super.init(frame: frame, textContainer: textContainer)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        self.bindable = Bindable<String?>(nil)
        super.init(coder: aDecoder)
    }
    
    @objc func textViewDidChange(_ textView: UITextView) {
        bindable.value = textView.text
        
        originalTextViewDidChange(textView)
    }
    
    @objc func originalTextViewDidChange(_ textView: UITextView) {
        print(textView.text)
    }
    
    func swizzleMethod() {
        
        guard let delegate = delegate else { return }
        
        let selfKlass = object_getClass(self)
        let delegateKlass = object_getClass(delegate)
        
        // Keep the original delegate's method under #originalTextViewDidChange.
//        if let method1 = class_getInstanceMethod(
//            delegateKlass,#selector(UITextViewDelegate.textViewDidChange)
//            ),
//            let method2 = class_getInstanceMethod(
//                selfKlass, #selector(originalTextViewDidChange)
//            ){
//            method_exchangeImplementations(method1, method2)
//        }
        
        // Set the custom implemention on delegate.
        if let method1 = class_getInstanceMethod(
            delegateKlass,#selector(UITextViewDelegate.textViewDidChange(_:))
            ),
            let method2 = class_getInstanceMethod(
                selfKlass, #selector(textViewDidChange(_:))
            ){
            method_exchangeImplementations(method1, method2)
        }
        
    }
    
}

