// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TransactionLedger {
    struct Transaction {
        address sender;
        address receiver;
        uint amount;
    }

    Transaction[] public transactions;

    event TransactionRecorded(address sender, address receiver, uint amount);

    function recordTransaction(address _receiver, uint _amount) public {
        transactions.push(Transaction(msg.sender, _receiver, _amount));
        emit TransactionRecorded(msg.sender, _receiver, _amount);
    }

    function getTransactionCount() public view returns (uint) {
        return transactions.length;
    }
}
