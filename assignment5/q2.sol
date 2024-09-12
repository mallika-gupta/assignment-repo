// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VotingSystem {
    
    struct Proposal {
        string description;
        uint256 voteCount;
    }

    address public owner;
    mapping(address => bool) public voters;
    Proposal[] public proposals;
    bool public votingEnded;

    // Event to announce new proposals
    event ProposalCreated(string description);

    // Event to announce a vote
    event VoteCasted(address voter, uint256 proposalId);

    // Event to announce the end of voting
    event VotingEnded(uint256 winningProposalId, string winningDescription);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can execute this");
        _;
    }

    modifier onlyVoters() {
        require(voters[msg.sender], "Not a registered voter");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    // Function to add a new proposal
    function addProposal(string memory _description) external onlyOwner {
        proposals.push(Proposal({
            description: _description,
            voteCount: 0
        }));
        
        emit ProposalCreated(_description);
    }

    // Function to register voters
    function registerVoter(address _voter) external onlyOwner {
        voters[_voter] = true;
    }

    // Function to cast a vote
    function vote(uint256 _proposalId) external onlyVoters {
        require(_proposalId < proposals.length, "Invalid proposal ID");
        require(!votingEnded, "Voting has ended");
        
        proposals[_proposalId].voteCount++;
        
        emit VoteCasted(msg.sender, _proposalId);
    }

    // Function to end voting and announce the winner
    function endVoting() external onlyOwner {
        require(!votingEnded, "Voting already ended");
        votingEnded = true;

        uint256 winningProposalId = determineWinner();
        emit VotingEnded(winningProposalId, proposals[winningProposalId].description);
    }

    // Function to determine the winning proposal
    function determineWinner() internal view returns (uint256) {
        uint256 winningProposalId;
        uint256 highestVoteCount = 0;

        for (uint256 i = 0; i < proposals.length; i++) {
            if (proposals[i].voteCount > highestVoteCount) {
                highestVoteCount = proposals[i].voteCount;
                winningProposalId = i;
            }
        }

        return winningProposalId;
    }
}
