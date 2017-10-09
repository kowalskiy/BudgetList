//
//  AddBudgetViewController.swift
//  BudgetList
//
//  Created by Kacper Kowalski on 28.08.2017.
//  Copyright © 2017 Kacper Kowalski. All rights reserved.
//

import UIKit

protocol BudgetDelegate: class {
    func enteredBudgetData(info: String, info2: Int)
}

class AddBudgetViewController: UIViewController {
    
    weak var delegate: BudgetDelegate? = nil
    
    @IBOutlet weak var budgetName: UITextField!
    @IBOutlet weak var budgetAmount: UITextField!
    
    // callback
    @IBAction func saveContent(_ sender: UIButton) {
        if ((budgetName.text?.isEmpty)! && (budgetAmount.text?.isEmpty)!) {
            navigationController?.pop(animated: true)
        } else {
            delegate?.enteredBudgetData(info: budgetName.text!, info2: Int(budgetAmount.text!) ?? 0)
            navigationController?.pop(animated: true)
        }
    }
}
