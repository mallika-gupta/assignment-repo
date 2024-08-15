// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventLogger {
    // Define an event to log when data is updated
    event DataUpdated(address indexed user, string oldData, string newData);

    // State variable to store data
    string public data;

    // Function to update the data and emit an event
    function updateData(string memory _newData) public {
        string memory oldData = data;
        data = _newData;
        
        // Emit the DataUpdated event
        emit DataUpdated(msg.sender, oldData, _newData);
    }
}
