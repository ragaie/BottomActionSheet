//
//  PickerList.swift
//  SomeWorkTest
//
//  Created by Ragaie alfy on 7/11/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    
    
    func DatePicker(_ datepicker: DatePicker, didSelectDate date: Date)
    
    
}



 class DatePicker: UIView {

    
    
    @IBOutlet weak var DoneButton: UIButton!
    @IBOutlet weak var headerLabel: UILabel!
  
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var selectItem : Int! = 0
   private  var showFlage :Bool! = false
    var delegate : DatePickerDelegate!
    
     var ID : String! = "pickerlist"
    var plurView : UIVisualEffectView!

    //MARK: Initializers
    override init(frame : CGRect) {
        super.init(frame : frame)
      initSubviews()
        initActionAndDelegete()

    }
    
  
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
        initActionAndDelegete()
        
        
        // change size and location after init it to not apper in view 
        self.frame = CGRect.init(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: 200)
    }
    
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //setButtons()
        
    }
    
    
    
    
    @IBInspectable var RestorationId : String!{
        didSet {
            
            ID = RestorationId
            
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            DoneButton.layer.cornerRadius = cornerRadius
            DoneButton.clipsToBounds = true
       
        }
    }
    @IBInspectable var headerColor: UIColor = UIColor.blue {
        didSet {
            
            headerLabel.backgroundColor = headerColor
        }
    }
    @IBInspectable var textColor: UIColor = UIColor.blue {
        didSet {
            DoneButton.setTitleColor(textColor, for: .normal)

        }
    }
    

    
    func initSubviews() {
        
        let bundle = Bundle(for: type(of: self))
        
        
        let nib = UINib(nibName: "DatePicker", bundle: bundle)
        
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        // to make view fit view in design you welcome.
       view.frame = self.bounds
        
        //   view.frame = CGRect.init(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: 200)
        // Make the view stretch with containing view
        // to fit like you want in storyboard
        view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        // nib.contentView.frame = bounds
        
        addSubview(view)
        plurView = UIVisualEffectView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        plurView.backgroundColor = UIColor.lightGray
        plurView.alpha = 0.5
        
        // custom initialization logic
        
    }
    
    
    
//    
    // add action of dropDown
    func initActionAndDelegete()  {
        
        
       
        //.addTarget(self, action:Selector("dismissView:") , for: .touchUpInside)
        
        
        DoneButton.addTarget(self, action: "selectItem:", for: .touchUpInside)
        let singleTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(PickerList.clickheader(_:)))
        singleTap.numberOfTapsRequired = 1
        plurView.addGestureRecognizer(singleTap)
        
    }
    

    
    
    /// show view
    func show() {
       
        if showFlage == false {
 
            UIApplication.shared.keyWindow?.addSubview(plurView)
            
            UIApplication.shared.keyWindow?.addSubview(self)
                UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
                    var basketTopFrame = self.frame
            
                    basketTopFrame.origin.y -= 200
            
            
                    self.frame = basketTopFrame
                }, completion: { finished in
                    print("Ragaie doors opened!")
                })
        
            showFlage = true
            }
        
    }
    
    
    func dismissView() {
       UIView.animate(withDuration: 0.3, delay:0, options: .curveEaseOut, animations: {
            var basketTopFrame = self.frame
            basketTopFrame.origin.y += 200
            self.frame = basketTopFrame
        }, completion: { finished in
            self.plurView.removeFromSuperview()
            self.self.removeFromSuperview()
            print("view removed !")
        })
        showFlage = false
        
    }
    
    func selectItem(_ sender: UIButton) -> Void {
        
        
        if delegate != nil {
        
           // delegate.pickerList(self, didSelectRowAt: selectItem)
            
            delegate.DatePicker(self, didSelectDate: datePicker.date)
        }
        
        dismissView()
       showFlage =  false
        
    }

    //Handle tap in view
    @objc func clickheader(_ sender : AnyObject)  {
        
        dismissView()
        
    }
    
 
}




