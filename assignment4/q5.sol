// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DonationContract {
    address public owner;

    // Event for donation logging
    event DonationMade(address indexed donor, address indexed recipient, uint256 amount);

    constructor() {
        owner = msg.sender;  // Contract creator becomes the owner
    }

    // Function to donate to a recipient
    function donate(address payable recipient) public payable {
        require(msg.value > 0, "Donation amount must be greater than zero");
        recipient.transfer(msg.value);  // Transfer the donated amount to the recipient
        
        emit DonationMade(msg.sender, recipient, msg.value);  // Emit event for logging
    }

    // Function to withdraw contract funds (if needed)
    function withdraw() public {
        require(msg.sender == owner, "Only the owner can withdraw funds");
        payable(owner).transfer(address(this).balance);
    }

    // Fallback function to accept ether
    receive() external payable {}
}
