//
//  BudgetListViewController.swift
//  BudgetList
//
//  Created by Kacper Kowalski on 28.08.2017.
//  Copyright © 2017 Kacper Kowalski. All rights reserved.
//

import UIKit

class BudgetListViewController: UITableViewController, BudgetDelegate {
    
    var budget = [Budget]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? AddBudgetViewController {
            destinationViewController.delegate = self
        }
    }

    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return budget.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let budgets = budget[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell") as! BudgetCell
            cell.budgetNameLabel.text = budgets.nameField
            return cell
    }

    @IBAction func cancelTapped(segue: UIStoryboardSegue)
    {}

    func enteredBudgetData(info: String) {
        budget.append(Budget(nameField: info, amountField: 0))
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        let row = indexPath.row
        print("ROW: \(row)")
        
        let destination = BudgetDetailsViewController()
        navigationController?.pushViewController(destination, animated: true)
    }
    
    
}



