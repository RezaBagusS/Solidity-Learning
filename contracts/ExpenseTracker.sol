// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

// Objective:
// 1. Create a loop to calculate all expenses for the user ✅
// HINT: Create total expenses variable with uint type ✅
// HINT: Loop over expenses array with for loop ✅
// HINT: add up all expenses cost ✅
// HINT: return total expenses ✅

contract ExpenseTracker {

    struct Expense {
        address user;
        string description;
        uint amount;
    }

    Expense[] public expenses;

    constructor() {
        expenses.push(Expense(msg.sender, "Groceries", 50));
        expenses.push(Expense(msg.sender, "Transportation", 30));
        expenses.push(Expense(msg.sender, "Dining Out", 25));
    }

    function addExpense(string memory _description, uint _amount) public {
        expenses.push(Expense(msg.sender, _description, _amount));
    }

    function getTotalExpenses(address _user) public view returns (uint) {
        
        uint256 totalExpenses;

        // CODE HERE
        uint i;
        for (i = 0; i < expenses.length; i++) 
        {
            if (expenses[i].user == _user) {
                totalExpenses += expenses[i].amount;
            }
        }

        return totalExpenses;
    }

}