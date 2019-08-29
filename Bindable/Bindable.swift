//
//  Bindable.swift
//  Bindable
//
//  Created by Florian MAFFINI on 25.11.18.
//  Copyright © 2018 Florian MAFFINI. All rights reserved.
//

import Foundation

public class Bindable<T> {
    
    public var bind: ((T) -> ())? {
        didSet {
            bind?(value)
        }
    }
    
    public var value: T {
        didSet {
            bind?(value)
        }
    }
    
    public init(_ value: T) {
        self.value = value
    }
    
}
