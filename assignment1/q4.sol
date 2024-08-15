// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Counter {
    // State variable to store the count
    uint256 public count;

    // Constructor to initialize the count
    constructor() {
        count = 0;
    }

    // Function to increment the count
    function increment() public {
        count += 1;
    }

    // Function to get the current count (optional since count is public)
    function getCount() public view returns (uint256) {
        return count;
    }
}
