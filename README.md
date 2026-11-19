# Secure Vault Implementation (Foundry)

A Solidity smart contract demonstrating the **Checks-Effects-Interactions** pattern to prevent Reentrancy attacks.

## Overview
This project was built to deeply understand how reentrancy vulnerabilities work at the EVM level. It includes a secure Vault contract where users can deposit and withdraw ETH.

## The Vulnerability
The original implementation updated the user's balance *after* sending ETH, making it vulnerable to a classic reentrancy exploit (similar to the DAO hack). 

## The Fix
The `withdraw` function follows the strict Checks-Effects-Interactions pattern. The user's balance is decremented *before* the external call is made, preventing any recursive reentrancy.

## Tests
Includes a comprehensive Foundry test suite covering:
- Deposits
- Withdrawals
- Reverts on insufficient balance

Run tests:
```bash
forge test