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
    
    
    var   customPicker :CustomPicker!
    override init() {
        super.init()
        
     
    }
    
 
    
    

    
    init(datePickerWithBlock doneText : String,mode : UIDatePickerMode ,local : Locale, onCompletion: @escaping((_ date:Date) -> Void)) {
        var  datePicker =   DatePicker.init(frame: CGRect.init(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: 200))
        datePicker.doneBlock = onCompletion
      //  datePicker.cancelBlock = onCancel
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
    
    
    init(sheetPickerWithdelegate doneText : String , delegate: SheetPickerDelegate,dataSource : [String]) {
        
       var actionPicker =   PickerList.init(frame: CGRect.init(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: 200))
        actionPicker.dataSourceItem = dataSource
        actionPicker.delegate = delegate
        actionPicker.buttonTitle = doneText

        actionPicker.show()
    }
    
    
    init(sheetPickerWithdblock doneText : String ,dataSource : [Any], onCompletion: @escaping ((_ index:Int) -> Void)) {
        
      var   actionPicker =   PickerList.init(frame: CGRect.init(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: 200))
        actionPicker.dataSourceItem = dataSource
        
        actionPicker.doneBlock = onCompletion
        actionPicker.buttonTitle = doneText

        actionPicker.show()
    }
    
    
    
    init(CustomePickerWithdblock doneText : String ,customView : UIView,height : Int) {
        
        customPicker  =   CustomPicker.init(frame: CGRect.init(x: 0, y: UIScreen.main.bounds.height,width: UIScreen.main.bounds.width, height: 200))
        customPicker.customViewToShow = customView
        // actionPicker.cancelBlock = onCancel
        customPicker.sheetHeight = CGFloat.init(height)
        //customPicker.show()
        //actionPicker.show()
    }
    
    func show(){
        
        customPicker.show()
        
        
    }
    func dismiss(){
        
        customPicker.dismissView()
        
    }
    
}
