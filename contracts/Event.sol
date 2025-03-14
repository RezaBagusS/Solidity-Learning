// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

// Objective:
// 1. Add an event called "NewUserRegistered" args(address user, string username)✅
// 2. Emit the event with msg.sender and username as the inputs✅

contract Event {

    event NewUserRegistered(address indexed user, string username);

    struct User {
        string username;
        uint256 age;
    }

    mapping(address => User) public users;

    function registUser(string memory _username, uint256 _age) public {
        User storage newUser = users[msg.sender];
        newUser.username = _username;
        newUser.age = _age;

        emit NewUserRegistered(msg.sender, _username);
    }

}