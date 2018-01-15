//
//  CustomPicker.swift
//  PickerList-Chtar
//
//  Created by Ragaie alfy on 1/14/18.
//  Copyright © 2018 Ragaie alfy. All rights reserved.
//

import UIKit

class CustomPicker: UIView {


   // @IBOutlet weak var DoneButton: UIButton!
   
    
    
    var selectItem : Int! = 0
    private  var showFlage :Bool! = false
    var doneBlock : ((_ index:Int) -> Void)!
 
    var ID : String! = "customeSheet"
    
    var plurView : UIVisualEffectView!
    
    var customViewToShow : UIView!
    var sheetHeight : CGFloat! = 200
    
    //MARK: Initializers
    override init(frame : CGRect) {
        super.init(frame : frame)
        initSubviews()
        initActionAndDelegete()
        
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
  
 
    
    
    
    func initSubviews() {

      //  let  view =  UIView.init(frame: CGRect.init(x: 5, y: UIScreen.main.bounds.height, width: 300, height: sheetHeight))

       // addSubview(view)
        
     self.frame = CGRect.init(x: 5, y: UIScreen.main.bounds.height, width:  UIScreen.main.bounds.width - 20, height: sheetHeight)
        
        plurView = UIVisualEffectView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        plurView.backgroundColor = UIColor.lightGray
        plurView.alpha = 0.5
        
        
        
    }
    
    
    
    // add action of of all View
    func initActionAndDelegete()  {
     
        
       // self.backgroundColor = UIColor.white

      //  DoneButton.addTarget(self, action: "selectItem:", for: .touchUpInside)
        let singleTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(PickerList.clickheader(_:)))
        singleTap.numberOfTapsRequired = 1
        plurView.addGestureRecognizer(singleTap)
  
    }
    
    
    

    
    
    /// show view
    func show() {
        
        if showFlage == false {
            ///add user view
            if customViewToShow != nil {

                customViewToShow.frame = CGRect.init(x: 5, y: 0, width: self.frame.width, height:  sheetHeight)
                self.addSubview(customViewToShow)
                
            }
            
            UIApplication.shared.keyWindow?.addSubview(plurView)
            UIApplication.shared.keyWindow?.addSubview(self)
            UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseOut, animations: {
                var basketTopFrame = self.frame
                
                basketTopFrame.origin.y -= self.sheetHeight
                
                
                self.frame = basketTopFrame
            }, completion: { finished in
               // print("Ragaie doors opened!")
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
            self.self.removeFromSuperview()
            
            //            if self.delegate != nil {
            //
            //                if self.delegate.pickerListDismissed != nil {
            //
            //                    self.delegate.pickerListDismissed!(self)
            //                }
            //
            //
            //            }
            //            if self.cancelBlock != nil {
            //                self.cancelBlock()
            //            }
        })
        showFlage = false
        
        
    }
    //Handle tap in view
    @objc func clickheader(_ sender : AnyObject)  {
        
        dismissView()
        
    }
    /// that call when done method selected
    @objc  func selectItem(_ sender: UIButton) -> Void {
//        if delegate != nil {
//            delegate.pickerList(self, didSelectRowAt: selectItem)
//        }
        
        if (doneBlock != nil){
            doneBlock(selectItem)
        }
        // dismiss view
        dismissView()
    }
    
    
    

}
