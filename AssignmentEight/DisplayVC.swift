//
//  DisplayVC.swift
//  AssignmentEight
//
//  Created by karma on 3/8/22.
//

import UIKit

class DisplayVC: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    // array to take the data from view controller
    var newEmp: [Employee] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        print("this is the received data from previous vc: \(newEmp)")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension DisplayVC: UICollectionViewDelegate{

}

extension DisplayVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newEmp.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EmployeeCollectionViewCell", for: indexPath) as! EmployeeCollectionViewCell
        cell.setup(emp: newEmp[indexPath.row])
        return cell
    }


}

extension DisplayVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height:200 )
    }
}
