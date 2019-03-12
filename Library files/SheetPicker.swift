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
    
    
    var   customPicker :Picker!
    private var pickerHeight : CGFloat {
        get {
            
            if UIDeviceOrientation.landscapeLeft == UIDevice.current.orientation  || UIDeviceOrientation.landscapeRight == UIDevice.current.orientation{
                if UIDevice.current.userInterfaceIdiom == .pad {
                    //do stuff
                    return UIScreen.main.bounds.height / 4
                }
                return UIScreen.main.bounds.height / 2
             
            }
            if UIDeviceOrientation.portrait == UIDevice.current.orientation {
            
                if UIDevice.current.userInterfaceIdiom == .pad {
                    //do stuff
                    return UIScreen.main.bounds.height / 5
                }
                return UIScreen.main.bounds.height / 4
            }
          return 200
        }
    }
    
    
    private var pickerWidth : CGFloat {
        get {
            
            if UIDeviceOrientation.landscapeLeft == UIDevice.current.orientation  || UIDeviceOrientation.landscapeRight == UIDevice.current.orientation{
                if UIDevice.current.userInterfaceIdiom == .pad {
                    //do stuff
                    return UIScreen.main.bounds.width / 3
                }
                return UIScreen.main.bounds.width / 2
                
            }
            if UIDeviceOrientation.portrait == UIDevice.current.orientation {
                
                 if UIDevice.current.userInterfaceIdiom == .pad {
                //do stuff
                return UIScreen.main.bounds.width / 2
                 }
                return UIScreen.main.bounds.width
            }
            return UIScreen.main.bounds.width
        }
    }
    private var pickerX : CGFloat {
        get {
            
            if UIDeviceOrientation.landscapeLeft == UIDevice.current.orientation  || UIDeviceOrientation.landscapeRight == UIDevice.current.orientation{
                if UIDevice.current.userInterfaceIdiom == .pad {
                    //do stuff
                    return (pickerWidth +  pickerWidth ) / 2
                }
                return pickerWidth / 2
                
            }
            if UIDeviceOrientation.portrait == UIDevice.current.orientation {
                if UIDevice.current.userInterfaceIdiom == .pad {
                    //do stuff
                    return pickerWidth  / 2
                }
                return 0
            }
            return 0
        }
    }
    
    private var pickerY : CGFloat {
        get {
            
          return UIScreen.main.bounds.height
        }
    }
   private var pickerFrame : CGRect{
        
        get{
            
            
            return CGRect.init(x:  pickerX  , y: pickerY, width: pickerWidth, height: pickerHeight)

            
        }
    }
    
    private var pickerCornerRaduis : CGFloat {
        get {
            
            if UIDeviceOrientation.landscapeLeft == UIDevice.current.orientation  || UIDeviceOrientation.landscapeRight == UIDevice.current.orientation{
                
                return 10
                
            }
            if UIDeviceOrientation.portrait == UIDevice.current.orientation {
                if UIDevice.current.userInterfaceIdiom == .pad {
                    //do stuff
                    return 10
                }
                return 0
            }
          
            return 0
        }
    }
    private var maskLayer  : CAShapeLayer {
    
        get {
            
            let path = UIBezierPath(roundedRect:(customPicker as! UIView ).bounds,
                                    byRoundingCorners:[.topRight, .topLeft],
                                    cornerRadii: CGSize(width: pickerCornerRaduis, height:  pickerCornerRaduis))
            let maskLayer = CAShapeLayer()
            maskLayer.path = path.cgPath
            return  maskLayer
            
            
         
            
        }
    }
    
    
    
    override init() {
        super.init()
   
     
    }

    ///MARK : Date picker part
 
    public  init(datePickerWithBlock doneText : String,mode : UIDatePicker.Mode ,local : Locale, onCompletion: @escaping((_ date:Date) -> Void)) {
        super.init()
        let  datePicker =   DatePicker.init(frame: pickerFrame)

        datePicker.doneBlock = onCompletion
        datePicker.pickerLocale = local
        datePicker.pickerMode = mode
        datePicker.buttonTitle = doneText
        customPicker = datePicker
        ///set corner raduis for top corner

        datePicker.layer.mask = maskLayer
        
        
        
   
        
        

    }
    public  init(datePickerWithBlock doneText : String,mode : UIDatePicker.Mode ,local : Locale, onCompletion: @escaping((_ date:Date) -> Void), onCancel: ((_ date:Date?) -> Void)? ) {
       
        super.init()
        let  datePicker =   DatePicker.init(frame: pickerFrame)
        datePicker.doneBlock = onCompletion
         datePicker.cancelBlock = onCancel
        datePicker.pickerLocale = local
        datePicker.pickerMode = mode
        datePicker.buttonTitle = doneText
        customPicker = datePicker

        ///set corner raduis for top corner
       datePicker.layer.mask = maskLayer


    }
    
   public   init(datePickerWithDelegate doneText : String,mode : UIDatePicker.Mode ,local : Locale,delegate : SheetPickerDateDelegate) {
        super.init()
        let  datePicker =   DatePicker.init(frame: pickerFrame)
        datePicker.delegate = delegate
        datePicker.pickerLocale = local
        datePicker.pickerMode = mode
        datePicker.buttonTitle = doneText
    ///set corner raduis for top corner
        customPicker = datePicker

        datePicker.layer.mask = maskLayer

    }
    
    
    
    
    
    //MARK : normal picker with any type of data
    
   public   init(sheetPickerWithdelegate doneText : String , delegate: SheetPickerDelegate,dataSource : [Any]) {
        super.init()
       let actionPicker =   PickerList.init(frame: pickerFrame)
        actionPicker.dataSourceItem = dataSource
        actionPicker.delegate = delegate
        actionPicker.buttonTitle = doneText
        customPicker = actionPicker
       actionPicker.layer.mask = maskLayer

    }
    
    
   public init(sheetPickerWithdblock doneText : String ,dataSource : [Any], onCompletion: @escaping ((_ index:Int) -> Void)) {
    super.init()
      let   actionPicker =   PickerList.init(frame:pickerFrame)
        actionPicker.dataSourceItem = dataSource
        actionPicker.doneBlock = onCompletion
        actionPicker.buttonTitle = doneText
        customPicker = actionPicker
        actionPicker.layer.mask = maskLayer

    }
    
    public init(sheetPickerWithdblock doneText : String ,dataSource : [Any] ,  onCompletion: @escaping ((_ index:Int) -> Void),  onCancelation:  ((_ index:Int) -> Void)?) {
        super.init()
        let   actionPicker =   PickerList.init(frame: pickerFrame)
        actionPicker.dataSourceItem = dataSource
        actionPicker.cancelBlock = onCancelation
        actionPicker.doneBlock = onCompletion
        actionPicker.buttonTitle = doneText
        customPicker = actionPicker
        actionPicker.layer.mask = maskLayer

    }
    
    
    
    
    
    
    
    
    //MARK :Create custom picker with what ever view you want
   public   init(CustomePickerWithView customView : UIView,height : CGFloat,width : CGFloat) {
      //  UIScreen.main.bounds.width
    let  customPickerView  =   CustomPicker.init(frame: CGRect.init(x: 0, y: UIScreen.main.bounds.height,width: width , height: height))
        customPickerView.customViewToShow = customView
        // actionPicker.cancelBlock = onCancel
        customPickerView.sheetHeight = height
    customPicker =  customPickerView
    }

    //init with block for show picker and block for hide it.
    public   init(CustomePickerWithView customView : UIView,height : CGFloat,width : CGFloat,didShow: (() -> ())?,  didHide:  (()->())?) {
        //  UIScreen.main.bounds.width
        let  customPickerView  =   CustomPicker.init(frame: CGRect.init(x: 0, y: UIScreen.main.bounds.height,width: width , height: height))
        customPickerView.customViewToShow = customView
    customPickerView.showBlock = didShow
        customPickerView.hideBlock = didHide
        // actionPicker.cancelBlock = onCancel
        customPickerView.sheetHeight = height
        customPicker =  customPickerView
    }
    
    
    public  func show(){
        customPicker.show()
    }
    
    
    public  func dismiss(){
        customPicker.dismissView()
    }
    
    
    
    
    
   
}
