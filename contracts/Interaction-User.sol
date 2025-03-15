// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

// Objective:
// 1. Create a new player and save it to player mapping with the given data ✅

contract User {

    struct Player {
        address playerAddress;
        string username;
        uint256 score;
    }

    mapping(address => Player) public players;

    function createUser(address _userAddress, string memory username) external {
        require(players[_userAddress].playerAddress == address(0), "USER ALREADY EXIST");
    
        // create a new player here
        Player memory newPlayer = Player({
            playerAddress: _userAddress,
            username: username,
            score: 0
        });

        players[_userAddress] = newPlayer;
    }

}