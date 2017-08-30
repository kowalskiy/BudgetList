//
//  AddExpensesViewController.swift
//  BudgetList
//
//  Created by Kacper Kowalski on 29.08.2017.
//  Copyright © 2017 Kacper Kowalski. All rights reserved.
//

import UIKit

protocol ExpenseDelegate: class {
    func enteredExpenseData(info: String, info2: Int)
}
class AddExpensesViewController: UIViewController {
    
    weak var delegate: ExpenseDelegate? = nil

    //
    @IBOutlet weak var expenseName: UITextField!
    @IBOutlet weak var expenseAmount: UITextField!
    
    @IBAction func saveExpenseContent(_ sender: UIButton) {
        if ((expenseName.text?.isEmpty)! && (expenseAmount.text?.isEmpty)!) {
            _ = self.navigationController?.popViewController(animated: true)
        } else {
            delegate?.enteredExpenseData(info: expenseName.text!, info2: Int(expenseAmount.text!)!)
            _ = self.navigationController?.popViewController(animated: true)
        }
    }
}

