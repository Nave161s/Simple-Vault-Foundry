// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// State Vairables

// Contract
contract Vault {

// Mapping 
mapping (address => uint256) public balance;
// Events 
event Deposited(address indexed user, uint256 amount);
event Withdrawn(address indexed user, uint256 amount);

// Errors
error InsufficientBalance();

// Functions

    function deposite() public payable {
        balance[msg.sender] += msg.value;
        emit Deposited(msg.sender, msg.value);
    }

    function withdraw(uint256 _amount) public {
        if (balance[msg.sender] < _amount) {
            revert InsufficientBalance();

        }
        balance[msg.sender] -= _amount;
        (bool success, ) = msg.sender.call{value: _amount}("");
        require(success, "Transfer failed");

        emit Withdrawn(msg.sender, _amount);
    }
    function getBalance() public view returns (uint256){
        return (balance[msg.sender]);

    }

}
