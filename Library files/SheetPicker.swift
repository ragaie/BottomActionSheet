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
    
 
    
    

    
    public  init(datePickerWithBlock doneText : String,mode : UIDatePickerMode ,local : Locale, onCompletion: @escaping((_ date:Date) -> Void)) {
        let  datePicker =   DatePicker.init(frame: CGRect.init(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: 200))
        datePicker.doneBlock = onCompletion
      //  datePicker.cancelBlock = onCancel
        datePicker.pickerLocale = local
        datePicker.pickerMode = mode
        datePicker.buttonTitle = doneText

        datePicker.show()
       
    }
    
    
   public   init(datePickerWithDelegate doneText : String,mode : UIDatePickerMode ,local : Locale,delegate : SheetPickerDateDelegate) {
        super.init()
        let  datePicker =   DatePicker.init(frame: CGRect.init(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: 200))
        datePicker.delegate = delegate
        datePicker.pickerLocale = local
        datePicker.pickerMode = mode
        datePicker.buttonTitle = doneText
        datePicker.show()
        
   
    }
    
    
   public   init(sheetPickerWithdelegate doneText : String , delegate: SheetPickerDelegate,dataSource : [Any]) {
        
       let actionPicker =   PickerList.init(frame: CGRect.init(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: 200))
        actionPicker.dataSourceItem = dataSource
        actionPicker.delegate = delegate
        actionPicker.buttonTitle = doneText

        actionPicker.show()
    }
    
    
   public init(sheetPickerWithdblock doneText : String ,dataSource : [Any], onCompletion: @escaping ((_ index:Int) -> Void)) {
        
      let   actionPicker =   PickerList.init(frame: CGRect.init(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: 200))
        actionPicker.dataSourceItem = dataSource
        
        actionPicker.doneBlock = onCompletion
        actionPicker.buttonTitle = doneText

        actionPicker.show()
    }
    
    
    
   public   init(CustomePickerWithdblock doneText : String ,customView : UIView,height : Int) {
        
        customPicker  =   CustomPicker.init(frame: CGRect.init(x: 0, y: UIScreen.main.bounds.height,width: UIScreen.main.bounds.width, height: 200))
        customPicker.customViewToShow = customView
        // actionPicker.cancelBlock = onCancel
        customPicker.sheetHeight = CGFloat.init(height)
        //customPicker.show()
        //actionPicker.show()
    }
    
    public  func show(){
        
        customPicker.show()
        
        
    }
    public  func dismiss(){
        
        customPicker.dismissView()
        
    }
    
}
