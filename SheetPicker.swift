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
    
    
    init(title : String) {
        
       var  datePicker =   DatePicker.init(frame: CGRect.init(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: 200))
       
        datePicker.show()
    }
    
    init(dataSource : [Any], onCompletion: @escaping ((_ index:Int) -> Void), onCancel: @escaping (()->Void )) {
        
        actionPicker =   PickerList.init(frame: CGRect.init(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: 200))
        actionPicker.dataSourceItem = dataSource
        
        actionPicker.doneBlock = onCompletion
        actionPicker.cancelBlock = onCancel
        actionPicker.show()
        //actionPicker.show()
    }
    
    

    
}
