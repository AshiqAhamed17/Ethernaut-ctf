// // SPDX-License-Identifier: MIT
// pragma solidity ^0.6.0;

// // import "openzeppelin-contracts-06/math/SafeMath.sol";

// contract Fallout {
//     // using SafeMath for uint256;

//     mapping(address => uint256) allocations;
//     address payable public owner;

//     /* constructor */
//     function Fal1out() public payable { //n can become the owner by calling this function lol!! its Fal1out not Fallout so, its not a constructor.
//         owner = msg.sender;
//         allocations[owner] = msg.value;
//     }

//     modifier onlyOwner() {
//         require(msg.sender == owner, "caller is not the owner");
//         _;
//     }

//     function allocate() public payable { // Can add allocations.
//         allocations[msg.sender] = allocations[msg.sender].add(msg.value);
//     }

//     function sendAllocation(address payable allocator) public { //Transfer allocations.
//         require(allocations[allocator] > 0);
//         allocator.transfer(allocations[allocator]);
//     }

//     function collectAllocations() public onlyOwner {
//         msg.sender.transfer(address(this).balance);
//     }

//     function allocatorBalance(address allocator) public view returns (uint256) {
//         return allocations[allocator];
//     }
// }