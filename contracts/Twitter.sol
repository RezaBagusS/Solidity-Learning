// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

import "@openzeppelin/contracts/access/Ownable.sol";

// Objective:
// 1. Import Ownable.sol contract from OpenZeppelin ✅
// 2. Inherit Ownable Contract ✅
// 3. Replace current onlyOwner ✅

contract Twitter is Ownable {

    // Event
    event TweetCreated(
        uint256 indexed id,
        address author,
        string content,
        uint256 timestamp
    );
    event TweetLiked(
        address liker,
        address tweetAuthor,
        uint256 tweetId,
        uint256 newLikeCount
    );
    event TweetUnLiked(
        address unliker,
        address tweetAuthor,
        uint256 tweetId,
        uint256 newLikeCount
    );

    mapping(address => Tweet[]) public tweets;

    uint16 public MAX_TWEET_LENGTH = 280;

    struct Tweet {
        uint256 id;
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }

    // Tambahkan konstruktor untuk memanggil Ownable
    constructor() Ownable(msg.sender) {}

    function changedTweetLength(uint16 newTweetLength) public onlyOwner {
        MAX_TWEET_LENGTH = newTweetLength;
    }

    function createTweet(string memory _tweet) public {
        require(
            bytes(_tweet).length <= MAX_TWEET_LENGTH,
            "Tweet is to long, max 280 characters"
        );

        Tweet memory newTweet = Tweet({
            id: tweets[msg.sender].length,
            author: msg.sender,
            content: _tweet,
            timestamp: block.timestamp,
            likes: 0
        });

        tweets[msg.sender].push(newTweet);

        emit TweetCreated(
            newTweet.id,
            newTweet.author,
            newTweet.content,
            newTweet.timestamp
        );
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

        emit TweetLiked(msg.sender, author, id, tweets[author][id].likes);
    }

    function unlikeTweet(uint256 id, address author) external {
        require(tweets[author][id].id == id, "TWEET DOES NOT EXIST");
        require(tweets[author][id].likes > 0, "TWEET DOES NOT LIKED");

        tweets[author][id].likes--;
        emit TweetUnLiked(msg.sender, author, id, tweets[author][id].likes);
    }

    // CODE HERE
    function getTotalLikes(address _author) external view returns (uint256) {
        uint256 totalLikes;

        for (uint256 i = 0; i < tweets[_author].length; i++) {
            totalLikes += tweets[_author][i].likes;
        }

        return totalLikes;
    }
}
