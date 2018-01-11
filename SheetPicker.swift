//
//  SheetPicker.swift
//  PickerList-Chtar
//
//  Created by Ragaie alfy on 1/11/18.
//  Copyright © 2018 Ragaie alfy. All rights reserved.
//

import Foundation
import UIKit
public class SheetPicker: NSObject{
    
    private var actionPicker : PickerList!
    
    private  var showFlage :Bool! = false
    
    override init() {
        super.init()
        
     
    }
    
    init(delegate: SheetPickerDelegate,dataSource : [String]) {
        
        actionPicker =   PickerList.init(frame: CGRect.init(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: 200))
        actionPicker.dataSourceItem = dataSource
        actionPicker.delegate = delegate
        actionPicker.show()
    }
    
    
    

    
    init(datePickerWithBlock doneText : String,mode : UIDatePickerMode ,local : Locale, onCompletion: @escaping((_ date:Date) -> Void), onCancel: @escaping (()->Void )) {
        var  datePicker =   DatePicker.init(frame: CGRect.init(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: 200))
        datePicker.doneBlock = onCompletion
        datePicker.cancelBlock = onCancel
        datePicker.pickerLocale = local
        datePicker.pickerMode = mode
        datePicker.buttonTitle = doneText

        datePicker.show()
       
    }
    
    
    init(datePickerWithDelegate doneText : String,mode : UIDatePickerMode ,local : Locale,delegate : SheetPickerDateDelegate) {
        super.init()
        var  datePicker =   DatePicker.init(frame: CGRect.init(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: 200))
        datePicker.delegate = delegate
        datePicker.pickerLocale = local
        datePicker.pickerMode = mode
        datePicker.buttonTitle = doneText
        datePicker.show()
        
       // NotificationCenter.default.addObserver(self, selector: #selector(SheetPicker.rotated), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
        NotificationCenter.default.addObserver(self, selector: "rotated", name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)

    }
    
    
    
    
    init(dataSource : [Any], onCompletion: @escaping ((_ index:Int) -> Void), onCancel: @escaping (()->Void )) {
        
        actionPicker =   PickerList.init(frame: CGRect.init(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: 200))
        actionPicker.dataSourceItem = dataSource
        
        actionPicker.doneBlock = onCompletion
        actionPicker.cancelBlock = onCancel
        actionPicker.show()
        //actionPicker.show()
    }
    
    
    func rotated(){
        
        print("device rotated")
        
    }
    
}
