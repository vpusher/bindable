//
//  BindableControl.swift
//  Bindable
//
//  Created by Florian MAFFINI on 25.11.18.
//  Copyright © 2018 Florian MAFFINI. All rights reserved.
//

import Foundation

protocol BindableControl {
    
    associatedtype BoundType
    
    var bindable: Bindable<BoundType> { get set }
}

//infix operator =>: AssignmentPrecedence
//infix operator <=: AssignmentPrecedence
//
//extension BindableControl {
//    static func <=(left: inout Self , right: Self) {
//        left.bindable = right.bindable
//    }
//    
//    static func =>(left: Self, right: inout Self) {
//        right.bindable = left.bindable
//    }
//}
