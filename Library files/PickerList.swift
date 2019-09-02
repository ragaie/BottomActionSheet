//
//  PickerList.swift
//  SomeWorkTest
//
//  Created by Ragaie alfy on 7/11/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit
//import AudioToolbox

// viewcontroller that contain this view
extension UIResponder {
    func owningViewController() -> UIViewController? {
        var nextResponser = self
        while let next = nextResponser.next {
            nextResponser = next
            if let vc = nextResponser as? UIViewController {
                return vc
            }
        }
        return nil
    }
}

@objc public protocol SheetPickerDelegate {
    func pickerList(_ pickerList: PickerList, didSelectRowAt row: Int)
    func pickerList(_ pickerList: PickerList, cancelAtRow row: Int)
}



public class PickerList: UIView,UIPickerViewDelegate,UIPickerViewDataSource,Picker {
    
    @IBOutlet weak var DoneButton: UIButton!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var containeView: UIView!
    
    private  var showFlage :Bool! = false
    var width :CGFloat? = UIScreen.main.bounds.width
    private var sheetHeight : CGFloat! = 200
    
    var selectItem : Int! = 0
    var doneBlock : ((_ index:Int) -> Void)!
    var cancelBlock : ((_ index:Int)->Void)?
    var dataSourceItem : [Any]! = []/// ["ghjghjghjhj","etertret","fsfsfs"]
    var delegate : SheetPickerDelegate!
    var buttonTitle : String! = "Done"
    var ID : String! = "pickerlist"
    var plurView : UIVisualEffectView!
    
    
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
        self.frame = CGRect.init(x: 0, y: UIScreen.main.bounds.height, width: width ?? UIScreen.main.bounds.width, height: 200)
    }
    
    func initSubviews() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "PickerList", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        // to make view fit view in design you welcome.
        view.frame = self.bounds
        // Make the view stretch with containing view
        // to fit like you want in storyboard
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        // nib.contentView.frame = bounds
        addSubview(view)
        
        containeView.clipsToBounds = true
        containeView.layer.mask = maskLayer
        let blurEffect = UIBlurEffect(style: .dark)
        // 3
        plurView = UIVisualEffectView(effect: blurEffect)
        plurView.frame  =  CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        plurView.alpha = 1
        
    }
    
    // add action of of all View
    func initActionAndDelegete()  {
        pickerView.delegate = self
        pickerView.dataSource = self
        DoneButton.addTarget(self, action: #selector(PickerList.selectItem(_:)), for: .touchUpInside)
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
    
    /////// pickerDataSource and delegate
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return dataSourceItem.count
    }
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return  "\(dataSourceItem[row])"
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectItem = row
    }
    
    
    
    /// show view
    func show() {
        if showFlage == false {
            DoneButton.setTitle(buttonTitle, for: .normal)
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
            basketTopFrame.origin.y += self.sheetHeight
            self.frame = basketTopFrame
        }, completion: { finished in
            // remove plurView and pickerVieew from Screen
            self.plurView.removeFromSuperview()
            self.self.removeFromSuperview()
            
        })
        showFlage = false
    }
    
    
    //Handle tap in view
    @objc func clickheader(_ sender : AnyObject)  {
        if self.delegate != nil {
            self.delegate.pickerList(self, cancelAtRow: self.selectItem)
        }
        if let cancelBlock = self.cancelBlock  {
            cancelBlock(self.selectItem)
        }
        dismissView()
    }
    
    /// that call when done method selected
    @objc  func selectItem(_ sender: UIButton) -> Void {
        if delegate != nil {
            delegate.pickerList(self, didSelectRowAt: selectItem)
        }
        if (doneBlock != nil){
            doneBlock(selectItem)
        }
        // dismiss view
        dismissView()
    }
  
    ///remove any listen for notification
    deinit {
        
        NotificationCenter.default.removeObserver(self)
    }
    
}







