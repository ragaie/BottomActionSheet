//
//  ViewController.swift
//  PickerList-Chtar
//
//  Created by Ragaie alfy on 7/19/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,SheetPickerDelegate{

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
        
        
        SheetPicker.init(title: "hello")
      //  SheetPicker.init(delegate: self, dataSource: item)
   
        
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

