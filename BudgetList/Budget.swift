//
//  Budget.swift
//  BudgetList
//
//  Created by Kacper Kowalski on 28.08.2017.
//  Copyright © 2017 Kacper Kowalski. All rights reserved.
//

import Foundation

struct Budget {
    
    let name: String
    let total: Int
    var expenses: [Expense]
    
    var balance: Int {
        var amount: Int = total
        for expense in expenses {
            amount -= (expense.amount)
        }
        return amount
    }
}
