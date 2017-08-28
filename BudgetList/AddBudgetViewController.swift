//
//  AddBudgetViewController.swift
//  BudgetList
//
//  Created by Kacper Kowalski on 28.08.2017.
//  Copyright © 2017 Kacper Kowalski. All rights reserved.
//

import UIKit

protocol BudgetDelegate: class {
    func enteredBudgetData(info: String)
}

class AddBudgetViewController: UIViewController {
    
    weak var delegate: BudgetDelegate? = nil

    @IBOutlet weak var budgetName: UITextField!
    @IBOutlet weak var budgetAmount: UITextField!
    
    //
    @IBAction func saveContent(_ sender: UIButton) {
       delegate?.enteredBudgetData(info: budgetName.text!)
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    
    
}
