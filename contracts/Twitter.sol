// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

// Objective:
// 1. Use Require to limit the length of the tweet to be only 280 characters ✅

contract Twitter {

    uint16 constant MAX_TWEET_LENGTH = 280;

    struct Tweet {
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }

    mapping (address => Tweet[]) private tweets;

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