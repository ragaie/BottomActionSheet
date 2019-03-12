# Sheet Bottom Picker
Picker form bottom you can find datePicker or any item picker, or you can add view what you want like table view or collectioncView
you can used in both way by delegate or block to listen to result selection. 

Also it work with automatic size for landscape and portrait for iphone and ipad
For custome view you full controll for width and hieght, and it automatic adjust in center of screen.

## You can find it in Appetize
- [Appetize](https://appetize.io/app/ayn2bek9dk9m4xm4pvdgd96yjw)


##  Installing
 Add blow for your pod file 
   ```
   pod 'ChtarBottomSheet' 
   run pod update
   ```
###Getting Started

A step by step series of examples that tell you have to get a development env running

Say what the step will be

```
import ChtarBottomSheet
```

## 1- date picker
```
    ///first declare 
         SheetPicker.init(datePickerWithBlock: "Done", mode: .dateAndTime, local: .init(identifier: "en")) { (date) in
              print(date)
        }.show()
        
        /////
         SheetPicker.init(datePickerWithBlock: "Done", mode: .dateAndTime, local: .init(identifier: "en"), onCompletion: {         (date) in
            print(date)
        }) { (date) in
            print(date)
        }.show()
                
        /// you can use it with delegate conform to  SheetPickerDateDelegate
        SheetPicker.init(datePickerWithDelegate: "ok", mode: .time, local: Locale.init(identifier: "ar"), delegate: self)
        
```
## 2- normal picker with any data Type
```
     
        
        SheetPicker.init(sheetPickerWithdblock: "Done", dataSource: [1,2,3]) { (index) in

            print(index)
        }.show()

         SheetPicker.init(sheetPickerWithdblock: "Done", dataSource: [], onCompletion: { (index) in
            
        }) { (index) in
            
        }.show()

        /// or use it with delegate 
        
         SheetPicker.init(sheetPickerWithdelegate: "Done", delegate: <#T##SheetPickerDelegate#>, dataSource: ["male","female"])
  
  ```
  ## 2- for use any custome view inside it 
   ```
   
     let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "TableView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! TableViewTest
        
        let cellNib = UINib(nibName: "TableCell", bundle: nil)
        view.tableViewData.register(cellNib, forCellReuseIdentifier: "cellTableID")
        
         view.tableViewData.delegate = myPresenter
         view.tableViewData.dataSource = myPresenter
         view.layer.cornerRadius = 12
        // custome piker
       var  customePicker =  SheetPicker.init(CustomePickerWithdblock: "hhh", customView: view,height : 300)
        
        customePicker.show()
        
        
        
        
        
        or. 
        
               SheetPicker.init(CustomePickerWithView: view, height: 200  , width: 400, didShow: {       
               
               print("heelo ")
               }) {            
           
                 print("hide")       
           
               }.show()
        
  ```
  
## you should get like this result  for ipad and iphone for both orintation
![Screenshot](https://github.com/ragaie/BottomActionSheet/blob/master/image1.png)

![Screenshot](https://github.com/ragaie/BottomActionSheet/blob/master/image2.png)
![Screenshot](https://github.com/ragaie/BottomActionSheet/blob/master/image3.png)

![Screenshot](https://github.com/ragaie/BottomActionSheet/blob/master/image4.png)
![Screenshot](https://github.com/ragaie/BottomActionSheet/blob/master/image5.png)
![Screenshot](https://github.com/ragaie/BottomActionSheet/blob/master/image6.png)
![Screenshot](https://github.com/ragaie/BottomActionSheet/blob/master/image7.png)

![Screenshot](https://github.com/ragaie/BottomActionSheet/blob/master/image8.png)

## Author

* **Ragaie alfy Fahmey**  - [ragaie](https://github.com/ragaie)

## You can find me in linked in 
- [Ragaie alfy](www.linkedin.com/in/ragaie-alfy)
