//
//  PickerList.swift
//  SomeWorkTest
//
//  Created by Ragaie alfy on 7/11/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit


@objc public protocol SheetPickerDateDelegate {
    func DatePicker(_ datepicker: DatePicker, didSelectDate date: Date)
    func DatePicker(_ datepicker: DatePicker, cancelAtDate date: Date)
}

public class DatePicker: UIView ,Picker{
    
    @IBOutlet weak var DoneButton: UIButton!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var containeView: UIView!
    
    var selectItem : Int! = 0
    private  var showFlage :Bool! = false
    private var sheetHeight : CGFloat! = 200
    
    var delegate : SheetPickerDateDelegate!
    var doneBlock : ((_ date:Date) -> Void)!
    var cancelBlock : ((_ date:Date)->Void)?
    var buttonTitle : String! = "Done"
    var ID : String! = "pickerlist"
    var plurView : UIVisualEffectView!
    
    var pickerLocale : Locale! = Locale.init(identifier: "en")
    var pickerMode : UIDatePicker.Mode! = .dateAndTime
    
    public var RestorationId : String!{
        didSet {
            
            ID = RestorationId
            
        }
    }
    
    private var pickerCornerRaduis : CGFloat {
        get {
            return 15
        }
    }
    
    private var maskLayer  : CAShapeLayer {
        get {
            let path = UIBezierPath(roundedRect:(self ).bounds,
                                    byRoundingCorners:[.topRight, .topLeft],
                                    cornerRadii: CGSize(width: pickerCornerRaduis, height:  pickerCornerRaduis))
            let maskLayer = CAShapeLayer()
            maskLayer.path = path.cgPath
            return  maskLayer
        }
    }
    
    //MARK: Initializers
    override init(frame : CGRect) {
        super.init(frame : frame)
        sheetHeight = frame.size.height
        initSubviews()
        initActionAndDelegete()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
        initActionAndDelegete()
        // change size and location after init it to not apper in view 
        self.frame = CGRect.init(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: 200)
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func initSubviews() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "DatePicker", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        // to make view fit view in design you welcome.
        view.frame = self.bounds
        // Make the view stretch with containing view
        // to fit like you want in storyboard
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        //addSubview(view)
        addSubview(view)
        containeView.clipsToBounds = true
        containeView.layer.mask = maskLayer
        // 2
        let blurEffect = UIBlurEffect(style: .dark)
        // 3
        plurView = UIVisualEffectView(effect: blurEffect)
        plurView.frame  =  CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        plurView.alpha = 1
    }
    
    // add action of dropDown
    func initActionAndDelegete()  {
        DoneButton.addTarget(self, action: #selector(DatePicker.selectItem(_:)), for: .touchUpInside)
        let singleTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DatePicker.clickheader(_:)))
        singleTap.numberOfTapsRequired = 1
        plurView.addGestureRecognizer(singleTap)
        NotificationCenter.default.addObserver(self, selector: #selector(DatePicker.rotated), name:  UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    @objc func rotated() {
        if  ( UIDevice.current.orientation.isLandscape) ||  UIDevice.current.orientation.isPortrait  {
            self.dismissView()
            
        }
    }
    
    /// show view
    func show() {
        // set some data for view befor using it
        datePicker.locale = pickerLocale
        datePicker.datePickerMode = pickerMode
        DoneButton.setTitle(buttonTitle, for: .normal)
        if showFlage == false {
            UIApplication.shared.keyWindow?.addSubview(plurView)
            UIApplication.shared.keyWindow?.addSubview(self)
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
                var basketTopFrame = self.frame
                basketTopFrame.origin.y -= self.sheetHeight
                self.frame = basketTopFrame
            }, completion: { finished in
                //  print("Ragaie doors opened!")
            })
            showFlage = true
        }
    }
 
    func dismissView() {
        UIView.animate(withDuration: 0.2, delay:0, options: .curveEaseOut, animations: {
            var basketTopFrame = self.frame
            basketTopFrame.origin.y += self.sheetHeight
            self.frame = basketTopFrame
        }, completion: { finished in
            self.plurView.removeFromSuperview()
            self.self.removeFromSuperview()
            // print("view removed !")
            
        })
        showFlage = false
    }
    
    @objc func selectItem(_ sender: UIButton) -> Void {
        if delegate != nil {
            delegate.DatePicker(self, didSelectDate: datePicker.date)
        }
        dismissView()
        showFlage =  false
        if (doneBlock != nil){
            doneBlock(datePicker.date)
        }
    }
    
    //Handle tap in view
    @objc func clickheader(_ sender : AnyObject)  {
        if self.delegate != nil {
            self.delegate.DatePicker(self, cancelAtDate: datePicker.date)
        }
        if let cancelBlock = self.cancelBlock  {
            cancelBlock(datePicker.date)
        }
        dismissView()
    }
  
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}




