# Assignment README (IU2141230108 , Mallika Gupta)

## Submition Date
12-09-2024 

## Solidity Smart Contract Example

This repository contains examples of Solidity smart contracts for two different applications: a token distribution platform and a reward-based voting system. These contracts showcase important Solidity concepts like fund distribution, time-based conditions, voting mechanics, and role-based access control. Each contract is accompanied by usage instructions and examples.

## Overview
The repository includes the following smart contracts:

Token Distribution Contract: Enables users to distribute tokens in exchange for contributions and manage the release or refund of tokens depending on the campaign’s success.
Reward-Based Voting Contract: Implements a voting system where participants can propose options, cast votes, and distribute rewards based on the outcome of the vote.
Token Distribution Contract
# Features:
Set up a token distribution campaign with a target amount and deadline.
Contributors can exchange funds for tokens during the campaign.
If the target is met before the deadline, tokens are distributed to the contributors.
If the target is not met, contributors can claim refunds.
The contract tracks total contributions and individual token allocations.
# Functions:
createTokenCampaign: Create a new campaign by specifying the target amount and duration.
contributeTokens: Exchange funds for tokens in an active campaign.
finalizeTokenCampaign: Finalize the campaign and release tokens if successful or allow refunds if the target is not reached.
withdrawTokens: Withdraw tokens if the campaign succeeds or request refunds if it fails.
## Example :
// Create a new token distribution campaign
createTokenCampaign(5000, 14 days);

// Contribute to the campaign in exchange for tokens
contributeTokens(5) payable;

// Finalize the campaign
finalizeTokenCampaign(1);

// Withdraw tokens or claim a refund if the campaign fails
withdrawTokens(1);



