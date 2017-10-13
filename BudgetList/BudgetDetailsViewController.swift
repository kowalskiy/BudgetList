//
//  BudgetDetailsViewController.swift
//  BudgetList
//
//  Created by Kacper Kowalski on 28.08.2017.
//  Copyright © 2017 Kacper Kowalski. All rights reserved.
//

import UIKit

protocol BudgetDetailsViewDelegate: class {
    func budgetDetailsViewDidUpdateBudget(budget: Budget)
}

class BudgetDetailsViewController: UITableViewController, ExpenseDelegate {
    
    var budget: Budget!
    weak var delegate: BudgetDetailsViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.setTitle(title: budget.name.capitalized, subtitle: ("$" + String(budget.total)))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? AddExpensesViewController {
            destinationViewController.delegate = self
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style:.plain, target:nil, action:nil)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return budget.expenses.count + 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < budget.expenses.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ExpenseCell") as! ExpenseCell
            cell.expense = budget.expenses[indexPath.row]
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BalanceCell") as! BalanceCell
            cell.textLabel?.text = "Wallet Balance: \(budget.balance.formatedCurrency)"
            
            return cell
        }
    }
    
    func enteredExpenseData(info: String, info2: Int) {
        budget.expenses.append(Expense(name: info, amount: info2))
        tableView.reloadData()
        delegate?.budgetDetailsViewDidUpdateBudget(budget: budget)
    }
}


