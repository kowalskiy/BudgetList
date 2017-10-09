//
//  BudgetDetailsViewController.swift
//  BudgetList
//
//  Created by Kacper Kowalski on 28.08.2017.
//  Copyright © 2017 Kacper Kowalski. All rights reserved.
//

import UIKit

class BudgetDetailsViewController: UITableViewController, ExpenseDelegate {
    
    var budgets: Budget!
    var expenses = [Expense]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.setTitle(title: (budgets.name.capitalized), subtitle: ("$" + String(describing: budgets.total)))
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
        return expenses.count + 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < expenses.count {
            let expense = expenses[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "ExpenseCell") as! ExpenseCell
            cell.textLabel?.text = expense.name
            cell.detailTextLabel?.text = ("$") + String(expense.amount)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BalanceCell") as! BalanceCell
            if let budget = budgets {
                cell.textLabel?.text = "Wallet Balance: $\(budget.balance)"
            }
            return cell
        }
    }
    
    func enteredExpenseData(info: String, info2: Int) {
        expenses.append(Expense(name: info, amount: info2))
        tableView.reloadData()
    }
}


//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let expense = expenses[indexPath.row]
//        let cell = tableView.dequeueReusableCell(withIdentifier: "ExpenseCell") as! ExpenseCell
//        cell.textLabel?.text = expense.name
//        cell.detailTextLabel?.text = ("$") + String(expense.amount)
//        return cell
//    }


