//
//  BudgetDetailsViewController.swift
//  BudgetList
//
//  Created by Kacper Kowalski on 28.08.2017.
//  Copyright © 2017 Kacper Kowalski. All rights reserved.
//

import UIKit

class BudgetDetailsViewController: UITableViewController, ExpenseDelegate {
    
    @IBOutlet weak var walletBalance: UILabel!
    var expense = [Expense]()
    var budgets: Budget! {
        didSet {
            if isViewLoaded {
                calculateWalletBudget(budget: <#T##String#>, expense: <#T##String#>)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.setTitle(title: budgets.nameField.capitalized, subtitle: ("$") + budgets.amountField)
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
        return expense.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let expenses = expense[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExpenseCell") as! ExpenseCell
        cell.textLabel?.text = expenses.expenseName
        cell.detailTextLabel?.text = ("$") + expenses.expenseAmount
        return cell
    }
    
    func enteredExpenseData(info: String, info2: String) {
        expense.append(Expense(expenseName: info, expenseAmount: info2))
        tableView.reloadData()
    }
    
    // MARK: - Calculate wallet
    
    func calculateWalletBudget(budget: String, expense: String) {
    }
}



