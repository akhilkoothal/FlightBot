//
//  MenuVC.swift
//  FightBot
//
//  Created by Akhil on 10/14/17.
//  Copyright © 2017 Akhil. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class MenuVC: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate {

    @IBOutlet weak var FoodNameTextField: UITextField!
    @IBOutlet weak var DrinksTextField: UITextField!
    @IBOutlet weak var seatNumberTextField: UITextField!
    
    var foodItems = ["Meals","Light Meal","Snacks","Vegetarian","Breakfast","Lunch"]
    var drinkItems = ["Pepsi","CocaCola","Sprite","Rum","Wine"]
    var seatNumber = ["A1","A2","A3","A4","A5","A6","A7","A8","A9","A10"]
    
    @IBOutlet weak var dropDown1: UIPickerView!
    @IBOutlet weak var dropDown2: UIPickerView!
    @IBOutlet weak var dropDown3: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //pickerView.da
       // OrderDetails()
        // Do any additional setup after loading the view.
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var countrows : Int = foodItems.count
        if(pickerView == dropDown2)
        {
            countrows = self.drinkItems.count
        }
        else if(pickerView == dropDown3)
        {
            countrows = self.seatNumber.count
        }
        return countrows
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == dropDown1
        {
            let titleRow = foodItems[row]
            return titleRow
        }
        else if pickerView == dropDown2
        {
            let titleRow = drinkItems[row]
            return titleRow
        }
        else if pickerView == dropDown3
        {
            let titleRow = seatNumber[row]
            return titleRow
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == dropDown1
        {
            self.FoodNameTextField.text = self.foodItems[row]
            self.dropDown1.isHidden = true
        }
        if pickerView == dropDown2
        {
            self.DrinksTextField.text = self.drinkItems[row]
            self.dropDown2.isHidden = true
        }
        if pickerView == dropDown3
        {
            self.seatNumberTextField.text = self.seatNumber[row]
            self.dropDown3.isHidden = true
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == self.FoodNameTextField
        {
            self.dropDown1.isHidden = false
        }
        else if textField == self.DrinksTextField
        {
            self.dropDown2.isHidden = false
        }
        if textField == self.seatNumberTextField
        {
            self.dropDown3.isHidden = false
        }

    }
    
    @IBAction func OrderDetails(_ sender: Any)
    {
        var ref: DatabaseReference!
        
        ref = Database.database().reference()
        
        ref.child("user").childByAutoId().setValue(["drinks": DrinksTextField.text,"food":FoodNameTextField.text,"seatNumber":seatNumberTextField.text])
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
