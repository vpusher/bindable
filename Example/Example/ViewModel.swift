//
//  ViewModel.swift
//  Example
//
//  Created by Florian MAFFINI on 25.11.18.
//  Copyright © 2018 Florian MAFFINI. All rights reserved.
//

import Foundation
import Bindable

class ViewModel {
    var text = Bindable<String?>("hello")
    var date = Bindable<Date>(Date())
    var counter = Bindable<Double>(23)
    var rate = Bindable<Float>(0.3)
    var state = Bindable<Bool>(true)
}
