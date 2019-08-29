//
//  ViewController.swift
//  Example
//
//  Created by Florian MAFFINI on 25.11.18.
//  Copyright © 2018 Florian MAFFINI. All rights reserved.
//

import UIKit
import Bindable

class ViewController: UIViewController {
    
    @IBOutlet weak var picker: BindableDatePicker!
    @IBOutlet weak var toggle: BindableSwitch!
    @IBOutlet weak var stepper: BindableStepper!
    @IBOutlet weak var slider: BindableSlider!
    @IBOutlet weak var textField: BindableTextField!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    
    var viewModel: ViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = ViewModel()
        
        // View to ViewModel.
        picker.bindable = viewModel.date
        textField.bindable = viewModel.text
        toggle.bindable = viewModel.state
        stepper.bindable = viewModel.counter
        slider.bindable = viewModel.rate
        
        // ViewModel to View.
        viewModel.text.bind = updateText
        viewModel.counter.bind = updateCounter
        viewModel.state.bind = updateState
        viewModel.date.bind = updateDate
        viewModel.rate.bind = updateRate
    }
    
    func updateDate(_ date: Date) {
        print(date)
        self.dateLabel.text = date.description
        self.picker.date = date
    }
    
    func updateText(_ title: String?) {
        print(title)
        self.textLabel.text = title
        self.textField.text = title
    }
    
    func updateCounter(_ counter: Double) {
        print(counter)
        self.counterLabel.text = String(counter)
        self.stepper.value = counter
        
    }
    
    func updateRate(_ rate: Float) {
        print(rate)
        self.rateLabel.text = String(rate)
        self.slider.value = rate
        
    }
    
    func updateState(_ state: Bool) {
        print(state)
        self.stateLabel.text = String(state)
        self.toggle.isOn = state
    }
}
