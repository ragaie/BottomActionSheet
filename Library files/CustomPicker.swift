//
//  CustomPicker.swift
//  PickerList-Chtar
//
//  Created by Ragaie alfy on 1/14/18.
//  Copyright © 2018 Ragaie alfy. All rights reserved.
//

import UIKit

class CustomPicker: UIView,Picker {

    var selectItem : Int! = 0
    private  var showFlage :Bool! = false
 
    var ID : String! = "customeSheet"
    var plurView : UIVisualEffectView!
    var showBlock : (()->())?
    var hideBlock : (()->())?
    var customViewToShow : UIView!
    var sheetHeight : CGFloat! = 200
    var sheetWidth : CGFloat! = UIScreen.main.bounds.width

    //MARK: Initializers
    override init(frame : CGRect) {
        super.init(frame : frame)
        sheetHeight = frame.height
        sheetWidth = frame.width
        initSubviews()
        initActionAndDelegete()
      
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
        initActionAndDelegete()
    
    }
    
   var RestorationId : String!{
        didSet {
            
            ID = RestorationId
            
        }
    }
  
    //MARK : Init SubView
    func initSubviews() {
        let xPosition = (UIScreen.main.bounds.width - sheetWidth) / 2
        self.frame = CGRect.init(x: xPosition, y: UIScreen.main.bounds.height, width:  sheetWidth, height: sheetHeight)
        let blurEffect = UIBlurEffect(style: .dark)
        // 3
        plurView = UIVisualEffectView(effect: blurEffect)
        plurView.frame  =  CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        plurView.alpha = 0.7
    
    }
    
    
    
    //MARK :  add action of of all View
    func initActionAndDelegete()  {
        let singleTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(PickerList.clickheader(_:)))
        singleTap.numberOfTapsRequired = 1
        plurView.addGestureRecognizer(singleTap)
        NotificationCenter.default.addObserver(self, selector: #selector(PickerList.rotated), name:  UIDevice.orientationDidChangeNotification, object: nil)

    }
    
    

///handle rodation of screen
@objc func rotated() {
    if  ( UIDevice.current.orientation.isLandscape) ||  UIDevice.current.orientation.isPortrait  {
        self.dismissView()
        
    }
}

    

    
    
    /// show view
    func show() {
        
        if showFlage == false {
            ///add user view
            if customViewToShow != nil {
                customViewToShow.frame = CGRect.init(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
                self.addSubview(customViewToShow)
            }
            UIApplication.shared.keyWindow?.addSubview(plurView)
            UIApplication.shared.keyWindow?.addSubview(self)
            UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseOut, animations: {
                var basketTopFrame = self.frame
                basketTopFrame.origin.y -= self.sheetHeight
                self.frame = basketTopFrame
            }, completion: { finished in
                if let showBlock = self.showBlock {
                   showBlock()
                }
            })
            showFlage = true
        }
        
    }
    
    
    
    
    
    
    
    /// dismiss view from screen
    func dismissView() {
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseOut, animations: {
            var basketTopFrame = self.frame
            basketTopFrame.origin.y +=  self.sheetHeight
            self.frame = basketTopFrame
        }, completion: { finished in
            // remove plurView and pickerVieew from Screen
            self.plurView.removeFromSuperview()
            self.removeFromSuperview()
            if let block = self.hideBlock  {
                
                block()
            }
        })
        showFlage = false
        
        
    }
    //Handle tap in view
    @objc func clickheader(_ sender : AnyObject)  {
        
        dismissView()
        
    }
    
    
    

}
