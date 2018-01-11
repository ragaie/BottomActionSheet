//
//  ViewController.swift
//  PickerList-Chtar
//
//  Created by Ragaie alfy on 7/19/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,SheetPickerDelegate,SheetPickerDateDelegate{
   
    

    @IBOutlet weak var selectGender: UIButton!
    
    
    
    var item = ["male","female"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    @IBAction func showPicker(_ sender: Any) {
        
        //pickerMenu.show()
        
        //["sdfds","sdfsd","aewe"]
//        SheetPicker.init(dataSource: [1,2,3,4,5,6,7], onCompletion: { (index) in
//            print(index)
//            
//        }) {
//            
//            print("selection canceled")
//        }
        
        
        
//// --------------> >>>> date picker
//        SheetPicker.init(datePickerWithBlock : "ok" ,mode: .time, local: Locale.init(identifier: "en"), onCompletion: { (date) in
//            print(date)
//        }) {
//            print("cancel view ")
//        }
        
        SheetPicker.init(datePickerWithDelegate: "ok", mode: .time, local: Locale.init(identifier: "ar"), delegate: self)
        
    }
    
    func DatePicker(_ datepicker: DatePicker, didSelectDate date: Date) {
        print(date)
    }
    func pickerList(_ pickerList: PickerList, didSelectRowAt row: Int) {
        
       
        print(row)
        selectGender.setTitle("\(item[row])", for: .normal)
   
    }
    
    
    
    
//    func pickerListDismissed(_ pickerList: PickerList) {
//        
//        print("view did dismiss")
//    }
}

