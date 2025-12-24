// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DataTypeExperiment {

    // State variables
    uint256 public number;
    string public text;
    bool public isActive;
    address public owner;
    bytes32 public dataHash;

    constructor() {
        number = 10;
        text = "Hello Solidity";
        isActive = true;
        owner = msg.sender;
        dataHash = keccak256(abi.encodePacked("Web3"));
    }

    // uint operation
    function increaseNumber(uint256 _value) public {
        number += _value;
    }

    // string operation
    function updateText(string memory _newText) public {
        text = _newText;
    }

    // bool operation
    function toggleStatus() public {
        isActive = !isActive;
    }

    // address operation
    function isOwner() public view returns (bool) {
        return msg.sender == owner;
    }

    // State vs Local variable demonstration
    function localVsState() public view returns (uint256) {
        uint256 localNumber = 5; // local variable
        return number + localNumber; // state + local
    }
}
