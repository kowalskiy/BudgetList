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
        
        let destinationVC = segue.destination as? BudgetDetailsViewController
        let cell = sender as? BudgetCell
        destinationVC?.navigationItem.title = cell?.budgetNameLabel.text
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
    }
    
    
}

//        if (segue.identifier == "showDetails") {
//            if let cell = sender as? BudgetCell?, let row = tableView.indexPath(for: cell!)?.row, let vc = segue.destination as? BudgetDetailsViewController {
//                vc.title = budget[row]
//            }
//        }


//        if (segue.identifier == "showDetails") {
//            var detailsView = segue.destination as! BudgetDetailsViewController
//            var index = tableView.indexPathForSelectedRow
//            detailsView.title = budget[index?.row]
//        }
//    }




