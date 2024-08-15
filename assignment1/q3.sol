// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GreetingContract {
    // State variable to store the greeting message
    string private greeting;

    // Function to set the greeting message
    function setGreeting(string memory _greeting) public {
        greeting = _greeting;
    }

    // Function to get the greeting message
    function getGreeting() public view returns (string memory) {
        return greeting;
    }
}
