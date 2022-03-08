//
//  EmployeeCollectionViewCell.swift
//  AssignmentEight
//
//  Created by karma on 3/8/22.
//

import UIKit

class EmployeeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var ageLbl: UILabel!
    @IBOutlet weak var salaryLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    
    func setup(emp: Employee){
        nameLbl.text = "Name: \(emp.name)"
        ageLbl.text = "Age: \(String(emp.age))"
        salaryLbl.text = "Salary: \(String(emp.salary))"
        typeLbl.text = "Type: \(emp.type)"
    }
}
