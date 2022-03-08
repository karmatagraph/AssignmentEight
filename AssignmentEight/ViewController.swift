//
//  ViewController.swift
//  AssignmentEight
//
//  Created by karma on 3/7/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var employeeLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var ageLbl: UILabel!
    @IBOutlet weak var ageTextfield: UITextField!
    @IBOutlet weak var salLbl: UILabel!
    @IBOutlet weak var salTextfield: UITextField!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var typeTextfield: UITextField!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var inputErrorLbl: UILabel!
    
    
    // create an empty array of type employee
    var emp: [Employee] = []
    var empCount = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func resetForm(){
        if(empCount < 4 ){
            nameTextfield.text = ""
            ageTextfield.text = ""
            salTextfield.text = ""
            typeTextfield.text = ""
            
        }else{
            nameLbl.isHidden = true
            ageLbl.isHidden = true
            salLbl.isHidden = true
            typeLbl.isHidden = true
            nameTextfield.isHidden = true
            ageTextfield.isHidden = true
            salTextfield.isHidden = true
            typeTextfield.isHidden = true
            nextBtn.setTitle("Done",for: .normal)
        }
        
//        inputErrorLbl.isHidden = true
    }

    @IBAction func nextBtnClicked(_ sender: UIButton) {
        if(empCount < 4 ){
            let name = nameTextfield.text!
            let ageT = ageTextfield.text!
            var age = 0
            let salT = salTextfield.text!
            var salary = 0.0
            let type = typeTextfield.text!
            
            let salSet = CharacterSet(charactersIn: salT)
            let ageSet = CharacterSet(charactersIn: ageT)
    //        && !CharacterSet.decimalDigits.isSuperset(of: ageSet)
            if (!CharacterSet.decimalDigits.isSuperset(of: salSet) ){
                // not empty
                age = Int(ageT)!
                salary = Double(salT)!
                let emp1 = Employee(name: name, age: age, salary: salary, type: type)
                emp.append(emp1)
                empCount = empCount + 1
                resetForm()
                print("the value in the array is: \(emp)")
                
            }else{
                inputErrorLbl.isHidden = false
                inputErrorLbl.text = "Please enter the valid inputs"
                print("error occured")
                resetForm()
            }
        }else{
            // go to the next page the collection view
            
            print("in the collection view")
            // sort the arrray
            let sortedEmp: [Employee] = emp.sorted{$0.salary > $1.salary}
            print("this is the sorted array :\(sortedEmp)")
            
            
            //pass the data to the display screen
            let destVC = self.storyboard?.instantiateViewController(withIdentifier: "DisplayVC") as! DisplayVC
            destVC.newEmp = sortedEmp
            self.navigationController?.pushViewController(destVC, animated: true)
        }
        
        
    }
}

