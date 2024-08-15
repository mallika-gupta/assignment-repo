// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UserNameStorage {
    // Mapping to store user names by their address
    mapping(address => string) private userNames;

    // Function to set the user's name
    function setUserName(string memory _name) public {
        userNames[msg.sender] = _name;
    }

    // Function to get the user's name
    function getUserName(address _user) public view returns (string memory) {
        return userNames[_user];
    }
}
