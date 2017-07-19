//
//  ViewController.swift
//  PickerList-Chtar
//
//  Created by Ragaie alfy on 7/19/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,PickerListDelegate{

    @IBOutlet weak var selectGender: UIButton!
    
    
    @IBOutlet weak var pickerMenu: PickerList!
    
    var item = ["male","female"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerMenu.delegate = self
        
        
        pickerMenu.dataSourceItem = item
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    @IBAction func showPicker(_ sender: Any) {
        
        pickerMenu.show()
    }
    
    
    func pickerList(_ pickerList: PickerList, didSelectRowAt row: Int) {
        
       
        
        selectGender.setTitle("\(item[row])", for: .normal)
        
        
        
    }
    
}

