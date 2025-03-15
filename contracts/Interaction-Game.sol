// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

// Objective:
// 1. Set up a connection to the User Contract throught IUser in constructor ✅
// 2. Call the createUser function with the correct inputs

interface IUser {
    function createUser(address _userAddress, string memory username) external;
}

contract Game {

    uint public gameCount;
    IUser public userContract;

    constructor(address _userContractAddress) {
        // code here
        userContract = IUser(_userContractAddress);
    }

    function startGame(string memory username) external {
        // Create a user in the User Contract
        gameCount++;

        //code here
        userContract.createUser(msg.sender, username);
    }

}