// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

// Objective:
// 1. Save UserProfile to the mapping in the setProfile() ✅
// HINT: don't forget to set the _displayName and _bio

contract Profile {
    struct UserProfile {
        string displayName;
        string bio;
    }

    mapping(address => UserProfile) internal profiles;

    function setProfile(string memory _displayName, string memory _bio) public {
        // CODE HERE

        profiles[msg.sender] = UserProfile({
            displayName: _displayName,
            bio: _bio
        });
    }

    function getProfile(address _user)
        public
        view
        returns (UserProfile memory)
    {
        return profiles[_user];
    }
}
