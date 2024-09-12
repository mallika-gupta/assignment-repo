// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Crowdfunding {
    
    struct Campaign {
        address payable creator;
        uint256 targetAmount;
        uint256 deadline;
        uint256 totalContributions;
        bool finalized;
        mapping(address => uint256) contributions;
    }

    uint256 public campaignCount = 0;
    mapping(uint256 => Campaign) public campaigns;

    // Event to announce new campaigns
    event CampaignCreated(uint256 id, address creator, uint256 targetAmount, uint256 deadline);

    // Event to announce contributions
    event ContributionMade(uint256 id, address contributor, uint256 amount);

    // Event to announce the finalization of the campaign
    event CampaignFinalized(uint256 id, bool successful);

    // Function to create a new campaign
    function createCampaign(uint256 _targetAmount, uint256 _duration) external {
        campaignCount++;
        Campaign storage newCampaign = campaigns[campaignCount];
        newCampaign.creator = payable(msg.sender);
        newCampaign.targetAmount = _targetAmount;
        newCampaign.deadline = block.timestamp + _duration;
        newCampaign.finalized = false;

        emit CampaignCreated(campaignCount, msg.sender, _targetAmount, newCampaign.deadline);
    }

    // Function to contribute to a campaign
    function contribute(uint256 _campaignId) external payable {
        Campaign storage campaign = campaigns[_campaignId];
        require(block.timestamp < campaign.deadline, "Campaign has ended");
        require(!campaign.finalized, "Campaign has been finalized");

        campaign.contributions[msg.sender] += msg.value;
        campaign.totalContributions += msg.value;

        emit ContributionMade(_campaignId, msg.sender, msg.value);
    }

    // Function to finalize the campaign
    function finalizeCampaign(uint256 _campaignId) external {
        Campaign storage campaign = campaigns[_campaignId];
        require(block.timestamp >= campaign.deadline, "Campaign is still ongoing");
        require(!campaign.finalized, "Campaign already finalized");

        if (campaign.totalContributions >= campaign.targetAmount) {
            // Target met, transfer funds to creator
            campaign.creator.transfer(campaign.totalContributions);
            campaign.finalized = true;
            emit CampaignFinalized(_campaignId, true);
        } else {
            // Target not met, contributors can withdraw
            campaign.finalized = true;
            emit CampaignFinalized(_campaignId, false);
        }
    }

    // Function to withdraw contributions if the campaign fails
    function withdrawContribution(uint256 _campaignId) external {
        Campaign storage campaign = campaigns[_campaignId];
        require(campaign.finalized, "Campaign not finalized yet");
        require(campaign.totalContributions < campaign.targetAmount, "Campaign was successful");
        
        uint256 contribution = campaign.contributions[msg.sender];
        require(contribution > 0, "No contributions to withdraw");

        campaign.contributions[msg.sender] = 0;
        payable(msg.sender).transfer(contribution);
    }
}
