// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "forge-std/Test.sol"
import "forge-std/console.sol";
import { Force } from "../src/Force.sol";

contract ForceTest is Test {
    Force force;

    function setUp() public {
        force = new Force();
    }

    function test_AttackForce() public payable {
        (bool s, ) = force.call{value: 1 ether}();
        require(s, "Not sent Successful");
    }
}