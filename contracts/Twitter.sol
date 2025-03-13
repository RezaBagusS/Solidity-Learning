// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

// Objective:
// 1. Create a Twitter Contract ✅
// 2. Create a mapping between user and tweet ✅
// 3. Add function to create a tweet and save it in mapping ✅
// 4. Create a function to get Tweet ✅

contract Twitter {

    mapping (address => string) private tweets;

    function createTweet(string memory _tweet) public {
        tweets[msg.sender] = _tweet;
        // tweets[key] = value
    }  

    function getTweets(address _owner) public view returns (string memory) {
        return tweets[_owner];
    }

    function deleteTweet(address _addr) public {
        delete tweets[_addr];
    }
}