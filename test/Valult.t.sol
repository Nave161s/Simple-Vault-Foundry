// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {Vault} from "../src/Vault.sol";

contract VaultTest is Test {
    Vault vault;
    address alice = address(0xA11CE);

    function setUp() public {
        vault = new Vault();
        vm.deal(alice, 10 ether);

    }

    function test_Deposite() public {
        vm.prank(alice);

        vault.deposite{value: 1 ether}();
        vm.prank(alice); assertEq(vault.getBalance(), 1 ether);
    }

    function test_Withdraw() public {
        vm.prank(alice);
        vault.deposite{value: 1 ether}();
        uint256 startingBalance = alice.balance;
        vm.prank(alice);
        vault.withdraw(1 ether);
        assertEq(vault.balance(alice), 0);
        assertEq(alice.balance, startingBalance + 1 ether);


    }
}
