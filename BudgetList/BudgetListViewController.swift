//
//  BudgetListViewController.swift
//  BudgetList
//
//  Created by Kacper Kowalski on 28.08.2017.
//  Copyright © 2017 Kacper Kowalski. All rights reserved.
//

import UIKit

class BudgetListViewController: UITableViewController {
    
    var budget = ["one", "two", "three"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return budget.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        cell.textLabel?.text = budget[indexPath.row]
    
        return cell
    }
    
    
    

    
    @IBAction func cancelTapped(segue: UIStoryboardSegue)
    {}

}
