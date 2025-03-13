// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

contract PausableToken {

    address public owner;
    bool public paused;
    mapping(address => uint) public balances;

    constructor() {
        owner = msg.sender;
        paused = false;
        balances[owner] = 1000;
    }

    // implement the modifier to allow only the owner to call the function
    modifier onlyOwner() {
        require(msg.sender == owner, "YOU ARE NOT THE OWNER!");
        _;
    }

    // implement the modifer to check if the contract is not pause
    modifier notPaused() {
        require(paused == false, "CONTRACT IS PAUSED");
        _;
    }   

    function pause() public onlyOwner {
        paused = true;
    }

    function unpause() public onlyOwner {
        paused = false;
    }

    // use the notPaused modifier in this function
    function transfer(address to, uint amount) public notPaused {
        require(balances[msg.sender] >= amount, "Insufficient Balace");

        balances[msg.sender] -= amount;
        balances[to] += amount;
    }



}