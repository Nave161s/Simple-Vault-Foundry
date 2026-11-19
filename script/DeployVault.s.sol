// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {Vault} from "../src/Vault.sol";

contract DeployVaullt is Script {
    function run() external {

        vm.startBroadcast();
        Vault vault = new Vault();
        vm.stopBroadcast();
    
    }
}