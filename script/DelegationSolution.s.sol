// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { Delegation } from "../src/Delegation.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract DelegationSolution is Script {
    Delegation public delegation = Delegation(0x73379d8B82Fda494ee59555f333DF7D44483fD58);

}