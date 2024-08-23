# assignment-repo
Blockchain Lab Assignment 

## Contracts Overview

### Lottery System Contract
- *File:* LotterySystem.sol
- *Description:* A Solidity-based lottery contract that allows users to enter the lottery, select a winner randomly, and handle payouts.
- *Features:*
  - *Random Number Generation:* Produces a pseudo-random number using `keccak256`.
  - *Enter Lottery:* Users can enter the lottery by sending more than 0.01 ether.
  - *Pick Winner:* The manager can randomly select a winner from the players.
  - *Clear Players:* After picking a winner, the players list is cleared.

