// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

// Objective:
// 1. Add id to Tweet Struct to make every Tweet Unique ✅
// 2. Set the id to be the Tweet[] length ✅
// HINT: You do it in the createTweet function
// 3. Add a function to like the tweet
// HINT: there should be 2 parameters, id and author
// 4. Add a function to unlike the tweet
// HINT: make sure you can unlike only if likes count is greater then 0
// 5. Mark both functions external

contract Twitter {

    mapping (address => Tweet[]) public tweets;
    uint16 public MAX_TWEET_LENGTH = 280;
    address public owner;

    struct Tweet {
        uint256 id;
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
            id: tweets[msg.sender].length,
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

    function likeTweet(uint256 id, address author) external {
        require(tweets[author][id].id == id, "TWEET DOES NOT EXIST");

        tweets[author][id].likes++;
    }

    function unlikeTweet(uint256 id, address author) external {
        require(tweets[author][id].id == id, "TWEET DOES NOT EXIST");
        require(tweets[author][id].likes > 0, "TWEET DOES NOT LIKED");

        tweets[author][id].likes--;
    }

}