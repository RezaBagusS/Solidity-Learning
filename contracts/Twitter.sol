// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

// Objective:
// 1. Define a Tweet Struct with author, content, timestamp, likes ✅
// 2. Add the structure to array ✅
// 3. Test Tweets ✅

contract Twitter {

    struct Tweet {
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }

    mapping (address => Tweet[]) private tweets;

    function createTweet(string memory _tweet) public {
        Tweet memory newTweet = Tweet({
            author: msg.sender,
            content: _tweet, 
            timestamp: block.timestamp,
            likes: 0
        });

        tweets[msg.sender].push(newTweet);
    }  

    function getTweets(address _owner, uint256 _i) public view returns (Tweet memory) {
        require(_i <= tweets[_owner].length, "Invalid tweet index");
        // Make sure this condition is true to continue, if false will be stop

        return tweets[_owner][_i];
    }

    function getAllTweets(address _owner) public view returns (Tweet[] memory) {
        return tweets[_owner];
    }

    function deleteTweet(address _addr) public {
        delete tweets[_addr];
    }
}