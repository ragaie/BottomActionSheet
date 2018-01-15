# Sheet Bottom Picker
Picker form bottom you can find datePicker or any item picker, or you can add view what you want like table view or collectioncView
you can used in both way by delegate or block to listen to result selection. 

## Getting Started
 Add blow for your pod file 
   ```
   pod 'ChtarBottomSheet' 
   run pod update
   ```
### Installing

A step by step series of examples that tell you have to get a development env running

Say what the step will be

```
import ChtarBottomSheet
```

## 1- date picker
```
        SheetPicker.init(datePickerWithBlock : "Done" ,mode: .dateAndTime, local: Locale.init(identifier: "en"), onCompletion: { (date) in
                    print(date)
                })
        /// you can use it with delegate conform to  SheetPickerDateDelegate
        SheetPicker.init(datePickerWithDelegate: "ok", mode: .time, local: Locale.init(identifier: "ar"), delegate: self)
        
```
## 2- normal picker with any data Type
```
     SheetPicker.init(sheetPickerWithdblock: "Done", dataSource: [1,2,3]) { (index) in

            print(index)
        }
        
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
  ```
  
## you should get like this result 

![Screenshot](https://github.com/ragaie/pickerList/blob/master/normal%20picker.png)
![Screenshot](https://github.com/ragaie/pickerList/blob/master/datePicker.png)
![Screenshot](https://github.com/ragaie/pickerList/blob/master/collectionView.png)
![Screenshot](https://github.com/ragaie/pickerList/blob/master/tableView.png)

![Screenshot](https://github.com/ragaie/pickerList/blob/master/home.png)

## Author

* **Ragaie alfy Fahmey**  - [ragaie alfy](https://github.com/ragaie)
## You can find me in linked in 
- [Ragaie alfy](www.linkedin.com/in/ragaie-alfy)
