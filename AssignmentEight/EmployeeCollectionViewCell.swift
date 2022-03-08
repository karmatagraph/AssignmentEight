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
        nameLbl.text = emp.name
        ageLbl.text = String(emp.age)
        salaryLbl.text = String(emp.salary)
        typeLbl.text = emp.type
    }
}
