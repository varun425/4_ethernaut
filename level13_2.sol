// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/solc-0.6/contracts/math/SafeMath.sol";
import "hardhat/console.sol";

contract GatekeeperOne {

  using SafeMath for uint256;
  address public entrant;

  modifier gateOne() {
    require(msg.sender != tx.origin);
    _;
  }

  modifier gateTwo() {
    console.log("2",gasleft());
    require(gasleft().mod(8191) == 0);
     console.log("3",gasleft());

    _;
  }

  modifier gateThree(bytes8 _gateKey) {
    //   require(uint32(uint64(_gateKey)) == uint16(uint64(_gateKey)), "GatekeeperOne: invalid gateThree part one");
    //   require(uint32(uint64(_gateKey)) != uint64(_gateKey), "GatekeeperOne: invalid gateThree part two");
    //   require(uint32(uint64(_gateKey)) == uint16(tx.origin), "GatekeeperOne: invalid gateThree part three");
    _;
  }

  function enter() public gateOne gateTwo returns (bool) {
    console.log("4",gasleft());  
    entrant = tx.origin;
    console.log("5",gasleft());
    return true;
  }
}


contract Enter {

 
    function callGK(address _gk) public payable{
       (bool success, bytes memory data) = _gk.call{value: msg.value, gas: 5000}(abi.encodeWithSignature("enter()"));
       
    }

}