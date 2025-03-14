// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

// Objective:
// 1. Inherit from the Multiplayer Game ✅
// 2. Call the parent joinGame() function ✅
// HINT : you might have to use the super keyword
// 3. Increment playerCount in joinGame() function ✅

contract MultiplayerGame {

    mapping(address => bool) public players;

    // Virtual menandakan bahwa fungsi bisa di override
    function joinGame() public virtual {
        players[msg.sender] = true;
    }

}

// Game contract inheriting from MultiplayerGame
contract Game is MultiplayerGame {

    string public gameName;
    uint256 public playerCount;

    constructor(string memory _gameName) {
        gameName = _gameName;
        playerCount = 0;
    }

    function startGame() public {
        // Perform game-specific logic here
    }

    function joinGame() public override {
        // code here
        super.joinGame();
        playerCount++;
    }

}