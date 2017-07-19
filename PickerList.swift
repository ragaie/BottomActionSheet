//
//  PickerList.swift
//  SomeWorkTest
//
//  Created by Ragaie alfy on 7/11/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit

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

protocol PickerListDelegate {
    
    
    func pickerList(_ pickerList: PickerList, didSelectRowAt row: Int)
    
    
}



@IBDesignable class PickerList: UIView,UIPickerViewDelegate,UIPickerViewDataSource {

    
    @IBOutlet weak var DismissButton: UIButton!
    
    @IBOutlet weak var DoneButton: UIButton!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
 
    
    var selectItem : Int! = 0
   private  var showFlage :Bool! = false
    var dataSourceItem : [Any]! = []/// ["ghjghjghjhj","etertret","fsfsfs"]
    var delegate : PickerListDelegate!
    
     var ID : String! = "pickerlist"
  
    //MARK: Initializers
    override init(frame : CGRect) {
        super.init(frame : frame)
      initSubviews()
    }
    
  
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
        initActionAndDelegete()
        
        
        // change size and location after init it to not apper in view 
        self.frame = CGRect.init(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: 200)
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
            
            
            DismissButton.layer.cornerRadius = cornerRadius
            DismissButton.clipsToBounds = true
            
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
            DismissButton.setTitleColor(textColor, for: .normal)

        }
    }
    

    
    func initSubviews() {
        
        let bundle = Bundle(for: type(of: self))
        
        
        let nib = UINib(nibName: "PickerList", bundle: bundle)
        
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        // to make view fit view in design you welcome.
       view.frame = self.bounds
        
        //   view.frame = CGRect.init(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: 200)
        // Make the view stretch with containing view
        // to fit like you want in storyboard
        view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        // nib.contentView.frame = bounds
        addSubview(view)
        
        // custom initialization logic
        
    }
    
    
    
//    
    // add action of dropDown
    func initActionAndDelegete()  {
        
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        
        DismissButton.addTarget(self, action: "dismissView:", for: .touchUpInside)
        //.addTarget(self, action:Selector("dismissView:") , for: .touchUpInside)
        
        
        DoneButton.addTarget(self, action: "selectItem:", for: .touchUpInside)
    }
    
    
    
//    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return dataSourceItem.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return  "\(dataSourceItem[row])"
        
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        selectItem = row
    }
    
    
    
    /// show view
    func show() {
       
        if showFlage == false {
        
//            var frameTemp = CGRect.init(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: 200)
                UIView.animate(withDuration: 1.0, delay: 0.2, options: .curveEaseOut, animations: {
                    var basketTopFrame = self.frame
            
                    basketTopFrame.origin.y -= 200
            
            
                    self.frame = basketTopFrame
                }, completion: { finished in
                    print("Ragaie doors opened!")
                })
        
            showFlage = true
            }
        
    }
    
    
    func dismissView(_ sender: UIButton) -> Void {
    
        UIView.animate(withDuration: 1.0, delay: 0.2, options: .curveEaseOut, animations: {
            var basketTopFrame = self.frame
            
            basketTopFrame.origin.y += 200
            
            
            self.frame = basketTopFrame
        }, completion: { finished in
            print("Ragaie doors opened!")
        })
        showFlage = false
        
    }
    
    func selectItem(_ sender: UIButton) -> Void {
        
        
        if delegate != nil {
        
            delegate.pickerList(self, didSelectRowAt: selectItem)
        }
       // print("\(dataSourceItem[selectItem]))")
        UIView.animate(withDuration: 1.0, delay: 0.2, options: .curveEaseOut, animations: {
            var basketTopFrame = self.frame
            
            basketTopFrame.origin.y += 200
            
            
            self.frame = basketTopFrame
        }, completion: { finished in
            print("Ragaie doors opened!")
        })
       showFlage =  false
        
    }

    
    
 
}




