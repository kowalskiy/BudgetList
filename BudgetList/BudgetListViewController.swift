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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style:.plain, target:nil, action:nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? AddBudgetViewController {
            destinationViewController.delegate = self
        }
        
        // pass cell's label to detailVC
        let destinationVC = segue.destination as? BudgetDetailsViewController
        let cell = sender as? BudgetCell
        destinationVC?.navigationItem.setTitle(title:(cell?.budgetNameLabel.text?.capitalized)!, subtitle:(cell?.detailTextLabel?.text)!)
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
            cell.detailTextLabel?.text = ("$") + String(budgets.amountField)
            return cell
    }

    @IBAction func cancelTapped(segue: UIStoryboardSegue)
    {}

    func enteredBudgetData(info: String, info2: String) {
        budget.append(Budget(nameField: info, amountField: info2))
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let row = indexPath.row
        print("ROW: \(row)")
    }
}

// MARK: - Subtitle on UINavigationBar

extension UINavigationItem {
    
    func setTitle(title:String, subtitle:String) {
        
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = UIFont.systemFont(ofSize: 17)
        titleLabel.sizeToFit()
        
        let subtitleLabel = UILabel()
        subtitleLabel.text = subtitle
        subtitleLabel.font = UIFont.systemFont(ofSize: 12)
        subtitleLabel.textAlignment = .center
        subtitleLabel.sizeToFit()
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        stackView.distribution = .equalCentering
        stackView.axis = .vertical
        
        let width = max(titleLabel.frame.size.width, subtitleLabel.frame.size.width)
        stackView.frame = CGRect(x: 0, y: 0, width: width, height: 35)
        
        stackView.alignment = .center
    
        self.titleView = stackView
    }
}

