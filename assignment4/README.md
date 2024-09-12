# Assignment4 README file (IU2141230108, Mallika Gupta)

## Submission Date
06-09-2024 

# Donation Smart Contract & Custom SHA-256 Hash Generator

## Overview

This project includes two main components:

1. A **JavaScript** application that generates input strings whose SHA-256 hash begins with a specific prefix.
2. An **Ethereum smart contract** written in **Solidity**, allowing users to donate Ether and enabling recipients to withdraw their donations.

---

## 1. SHA-256 Hash Generator in JavaScript

### **JavaScript Code Explanation**

The project includes three variations of a SHA-256 hash generator:

#### **Version 1: Basic SHA-256 Prefix Finder**
This version brute forces input strings by hashing an integer (`i`) and looks for a SHA-256 hash that starts with `"0000"`.

```javascript
const crypto = require('crypto');

function findStringWithSHA256Prefix(prefix = '0000') {
    let i = 0;
    while (true) {
        const inputString = i.toString();  // Convert the integer to string
        const hash = crypto.createHash('sha256').update(inputString).digest('hex');  // Generate SHA-256 hash
        if (hash.startsWith(prefix)) {  // Check if the hash starts with the required prefix
            console.log(`Input string: ${inputString}`);
            console.log(`SHA-256 hash: ${hash}`);
            return;
        }
        i++;
    }
}

findStringWithSHA256Prefix();
```

#### **Version 2: Custom Prefix Hash Finder**
This version uses a custom string (`devadnani26`), concatenated with a number, to find a hash starting with `"0000"`.

```javascript
const name = "devadnani26";

function findStringWithSHA256Prefix(prefix = '0000') {
    let i = 0;
    while (true) {
        const inputString = name + i.toString();  // Concatenate custom name with the incrementing number
        const hash = crypto.createHash('sha256').update(inputString).digest('hex');  // Generate SHA-256 hash
        if (hash.startsWith(prefix)) {
            console.log(`Input string: ${inputString}`);
            console.log(`SHA-256 hash: ${hash}`);
            return;
        }
        i++;
    }
}

findStringWithSHA256Prefix();
```

#### **Version 3: Custom Transaction Message Hash Finder**
This version looks for a SHA-256 hash that starts with `"0000"` using a string containing transaction details and a number.

```javascript
const text = "Mallika => Alex | Rs 500, Alex => Sam | Rs 100";

function findStringWithSHA256Prefix(prefix = '0000') {
    let i = 0;
    while (true) {
        const inputString = text + i.toString();  // Concatenate transaction details with an incrementing number
        const hash = crypto.createHash('sha256').update(inputString).digest('hex');  // Generate SHA-256 hash
        if (hash.startsWith(prefix)) {
            console.log(`Input string: ${inputString}`);
            console.log(`SHA-256 hash: ${hash}`);
            return;
        }
        i++;
    }
}

findStringWithSHA256Prefix();
```

### **How to Run the JavaScript Code**

1. Install Node.js on your system.
2. Create a file (e.g., `hashGenerator.js`) and paste the code.
3. Run the code using Node.js:
   ```
   node hashGenerator.js
   ```

The script will generate input strings until one produces a SHA-256 hash starting with `"0000"`.

---

## 2. Donation Smart Contract in Solidity

### **Solidity Code Explanation**

This Ethereum smart contract allows users to donate Ether to specified recipients and enables the recipients to withdraw their donations securely.

#### **Key Features**

1. **Donating Ether**:
   - Users can call the `donate()` function to send Ether to a specific recipient’s address.
   - The recipient’s balance is tracked in a mapping (`recipientBalances`).

2. **Withdrawing Donations**:
   - Recipients can call `withdrawFunds()` to withdraw their Ether.
   - To prevent reentrancy attacks, the balance is reset before transferring the funds.

3. **Checking Balances**:
   - A `getRecipientBalance()` function lets users view a recipient's donation balance.

#### **Smart Contract Code**

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract DonationContract {
    // Mapping to store donation balances for each recipient
    mapping(address => uint256) public recipientBalances;

    // Event for logging donations
    event DonationReceived(address indexed donor, address indexed recipient, uint256 amount);

    // Event for logging withdrawals
    event FundsWithdrawn(address indexed recipient, uint256 amount);

    // Function to make a donation to a specific recipient
    function donate(address recipient) public payable {
        require(msg.value > 0, "Donation must be greater than zero");

        // Add the donated amount to the recipient's balance
        recipientBalances[recipient] += msg.value;

        // Emit the DonationReceived event
        emit DonationReceived(msg.sender, recipient, msg.value);
    }

    // Function for the recipient to withdraw their funds
    function withdrawFunds() public {
        uint256 balance = recipientBalances[msg.sender];
        require(balance > 0, "No funds to withdraw");

        // Reset the balance before transferring to prevent reentrancy attacks
        recipientBalances[msg.sender] = 0;

        // Transfer the funds
        (bool success, ) = msg.sender.call{value: balance}("");
        require(success, "Transfer failed");

        // Emit the FundsWithdrawn event
        emit FundsWithdrawn(msg.sender, balance);
    }

    // Function to check a recipient's balance
    function getRecipientBalance(address recipient) public view returns (uint256) {
        return recipientBalances[recipient];
    }
}
```

### **How to Deploy and Interact with the Contract**

1. **Deploying the Contract**:
   - Use Remix IDE or any Ethereum development tool to deploy the contract on a test network.
   - Ensure your wallet has sufficient Ether for deployment.

2. **Making Donations**:
   - Call the `donate()` function, specifying the recipient’s address and sending some Ether.

3. **Withdrawing Donations**:
   - The recipient can call `withdrawFunds()` to transfer their donations to their wallet.

4. **Checking Balances**:
   - Use the `getRecipientBalance()` function to view any recipient’s donation balance.

---

## Conclusion

This project combines a JavaScript application to brute-force SHA-256 hashes with a Solidity smart contract for handling Ether donations. You can run the JavaScript code locally with Node.js and deploy the Solidity contract on an Ethereum-compatible blockchain.
