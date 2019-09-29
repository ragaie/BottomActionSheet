//
//  ViewController.swift
//  PickerList-Chtar
//
//  Created by Ragaie alfy on 7/19/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    
   
    

  
    var item = ["male","female","male","female","male","female","male","female"]
    var myPresenter : ViewPresenter!
    
    var customePicker : SheetPicker!
    override func viewDidLoad() {
        super.viewDidLoad()
      myPresenter = ViewPresenter()
        myPresenter.myView = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    @IBAction func showPicker(_ sender: Any) {
        

////// piker for normal data

        SheetPicker.init(sheetPickerWithdblock: "Done", dataSource: item) { (index) in

            print(index)
        }.show()

        

    }
    
    
    @IBAction func showDatePicker(_ sender: Any) {
        
        
        
        SheetPicker.init(datePickerWithBlock: "Done", mode: .dateAndTime, local: Locale.init(identifier: "en"), maxDate: nil, minDate: nil) { (date) in
        
            
        }.show()
        //// --------------> >>>> date picker
//        SheetPicker.init(datePickerWithBlock : "Done" ,mode: .date, local: Locale.init(identifier: "en"), onCompletion: { (date) in
//                            print(date)
//                        }).show()
//
//        SheetPicker.init(datePickerWithBlock: "date", mode: .date, local: .init(identifier: "en"), onCompletion: { (date) in
//            
//        }, onCancel: nil)
//        
     //   SheetPicker.init(datePickerWithDelegate: "ok", mode: .time, local: Locale.init(identifier: "ar"), delegate: self)
        
        
        
    }
    
    
    @IBAction func showCustomPicker(_ sender: Any) {
        /// load custom view and add it to view movement 
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "TableView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! TableViewTest

        let cellNib = UINib(nibName: "TableCell", bundle: nil)
        view.tableViewData.register(cellNib, forCellReuseIdentifier: "cellTableID")

         view.tableViewData.delegate = myPresenter
         view.tableViewData.dataSource = myPresenter
        // custome piker
        customePicker =  SheetPicker.init(CustomePickerWithView : view, height: 500)

        customePicker.show()

    
//        /// load custom view and add it to view movement
//        let bundle = Bundle(for: type(of: self))
//        let nib = UINib(nibName: "CollectionData", bundle: bundle)
//        let view = nib.instantiate(withOwner: self, options: nil)[0] as! CollectionDataTest
//
//        let cellNib = UINib(nibName: "CollectionCell", bundle: nil)
//        view.collectionDataPlay.register(cellNib, forCellWithReuseIdentifier: "collectionCellID")
//
//
//        view.collectionDataPlay.delegate = myPresenter
//        view.collectionDataPlay.dataSource = myPresenter
//        // view.layer.cornerRadius = 12
//        // custome piker
//        customePicker =  SheetPicker.init(CustomePickerWithView: view, height: 400)
//        customePicker.show()
//
//
        
        
    }
    
    
    
    
    
    @IBAction func loadCollection(_ sender: Any) {
        
        /// load custom view and add it to view movement
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "CollectionData", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! CollectionDataTest
        
        let cellNib = UINib(nibName: "CollectionCell", bundle: nil)
        view.collectionDataPlay.register(cellNib, forCellWithReuseIdentifier: "collectionCellID")
        
        
        view.collectionDataPlay.delegate = myPresenter
        view.collectionDataPlay.dataSource = myPresenter
        // custome piker
        customePicker =  SheetPicker.init(CustomePickerWithView: view, height: 500)
        customePicker.show()
        
      //  view.collectionDataPlay.updateConstraintsIfNeeded()
        
        
        
        
    }
    
    
    
    
    
    
  


}

extension ViewController :SheetPickerDelegate{
    
    
    
    func pickerList(_ pickerList: PickerList, didSelectRowAt row: Int) {
        
        
        print(row)
        // selectGender.setTitle("\(item[row])", for: .normal)
        
    }
    
    func pickerList(_ pickerList: PickerList, cancelAtRow row: Int) {
        
        print("fffff")
    }
    
}


extension ViewController : SheetPickerDateDelegate{
    func DatePicker(_ datepicker: DatePicker, cancelAtDate date: Date) {
        print("Hello at date :- ",date)
    }
    
    func DatePicker(_ datepicker: DatePicker, didSelectDate date: Date) {
        print(date)
    }
    
   
    
    
    
}
