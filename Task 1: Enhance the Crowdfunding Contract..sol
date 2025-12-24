// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CrowdfundingCampaign {

    // State variables
    string private campaignName;
    string private campaignDescription;
    uint256 private fundingGoal;
    uint256 private totalFundsRaised;
    address private campaignCreator;

    uint256 private campaignDeadline;      // timestamp
    uint256 private minimumContribution;
    bool private isCampaignActive;

    // Constructor
    constructor(
        string memory _name,
        string memory _description,
        uint256 _goal,
        uint256 _deadlineInDays,
        uint256 _minContribution
    ) {
        campaignName = _name;
        campaignDescription = _description;
        fundingGoal = _goal;
        totalFundsRaised = 0;
        campaignCreator = msg.sender;

        campaignDeadline = block.timestamp + (_deadlineInDays * 1 days);
        minimumContribution = _minContribution;
        isCampaignActive = true;
    }

    // -------- Individual Getter Functions --------
    function getName() public view returns (string memory) {
        return campaignName;
    }

    function getDescription() public view returns (string memory) {
        return campaignDescription;
    }

    function getFundingGoal() public view returns (uint256) {
        return fundingGoal;
    }

    function getTotalFundsRaised() public view returns (uint256) {
        return totalFundsRaised;
    }

    function getCreator() public view returns (address) {
        return campaignCreator;
    }

    function getDeadline() public view returns (uint256) {
        return campaignDeadline;
    }

    function getMinimumContribution() public view returns (uint256) {
        return minimumContribution;
    }

    function getCampaignStatus() public view returns (bool) {
        return isCampaignActive;
    }

    // -------- Helper Functions --------
    function remainingFundingNeeded() public view returns (uint256) {
        if(totalFundsRaised >= fundingGoal){
            return 0;
        }
        return fundingGoal - totalFundsRaised;
    }

    function daysUntilDeadline() public view returns (uint256) {
        if(block.timestamp >= campaignDeadline){
            return 0;
        }
        return (campaignDeadline - block.timestamp) / 1 days;
    }

    function isAcceptingDonations() public view returns (bool) {
        return isCampaignActive && block.timestamp < campaignDeadline;
    }
}
