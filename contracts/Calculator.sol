// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

// Objective:
// 1. Make a contract called calculator ✅
// 2. Create result variable to store result ✅
// 3. Create functions to add, subtract, and multiply to result ✅
// 4. Create a function to get result ✅

contract BasicCalculator {

    uint256 internal result; 

    function add(uint256 a, uint256 b) internal {
        result = a + b;
    }

    function subtract(uint256 a, uint256 b) internal {
        result = a - b;
    }

}

contract AdvanceCalculator is BasicCalculator {

    function multiply(uint256 a, uint256 b) internal {
        result = a * b;
    }

    function devide(uint256 a, uint256 b) internal {
        require(b != 0, "Division by zero");
        result = a / b;
    }

    function performOperation(uint256 a, uint256 b, uint8 operation) public {
        if (operation == 0) add(a, b);
        else if (operation == 1) subtract(a, b);
        else if (operation == 2) multiply(a, b);
        else if (operation == 3) devide(a, b);
        else revert("Invalid Operation");
    }

    function getResult() public view returns (uint256) {
        return result;
    }

    function getOwner() external view returns (address) {
        return msg.sender;
    }

}

// Visibility or Encapsulation
// 1. public : internal or external can access
// 2. private : only internal contract can access
// 3. internal : only internal contract and others inheriting contracts
// 4. external : only accessed from external contracts or accounts

// Pure
// Digunakan ketika fungsi mengubah dan tidak membaca state, biasanya untuk digunakan bersama return

// View
// Jika fungsi membaca dan tidak mengubah state maka gunakan ini 

// Tanpa modifier
// Jika fungsi membaca dan merubah state tidak perlu gunakan pure atau view