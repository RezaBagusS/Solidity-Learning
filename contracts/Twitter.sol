// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

// Objective:
// 1. Add function called changedTweetLength to change max tweet length ✅
// HINT: use newTweetLength as input for function ✅
// 2. Create a constructor function to set an owner of contract ✅
// 3. Create a modifier called onlyOwner ✅
// 4. Use onlyOwner on the changeTweetLength function ✅

contract Twitter {

    mapping (address => Tweet[]) private tweets;
    uint16 public MAX_TWEET_LENGTH = 280;
    address public owner;

    struct Tweet {
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(owner == msg.sender, "YOU ARE NOT THE OWNER!!");
        _;
    }

    function changedTweetLength(uint16 newTweetLength) public onlyOwner {
        MAX_TWEET_LENGTH = newTweetLength;
    }

    function createTweet(string memory _tweet) public {

        require(bytes(_tweet).length <= MAX_TWEET_LENGTH, "Tweet is to long, max 280 characters");

        Tweet memory newTweet = Tweet({
            author: msg.sender,
            content: _tweet, 
            timestamp: block.timestamp,
            likes: 0
        });

        tweets[msg.sender].push(newTweet);
    }  

    function getTweets(uint256 _i) public view returns (Tweet memory) {
        require(_i <= tweets[msg.sender].length, "Invalid tweet index");
        // Make sure this condition is true to continue, if false will be stop

        return tweets[msg.sender][_i];
    }

    function getAllTweets(address _owner) public view returns (Tweet[] memory) {
        return tweets[_owner];
    }

    function deleteTweet(address _addr) public {
        delete tweets[_addr];
    }
    
}