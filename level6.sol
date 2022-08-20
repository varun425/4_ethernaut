// // SPDX-License-Identifier: MIT
// pragma solidity ^0.6.0;

// contract Delegate {

//   address public owner;

//   constructor(address _owner) public {
//     owner = _owner;
//   }

//   function pwn() public {
//     owner = msg.sender;
//   }
// }

// contract Delegation {

//   address public owner;
//   Delegate delegate;

//   constructor(address _delegateAddress) public {
//     delegate = Delegate(_delegateAddress);
//     owner = msg.sender;
//   }

//   fallback() external {
//     (bool result,) = address(delegate).delegatecall(msg.data);
//     if (result) {
//       this;
//     }
//     else{
//         revert();
//     }
//   }

// //   function getfunc() public pure returns(bytes memory){
// //       return abi.encodeWithSignature("pwn()");
// //   }
// }

// //0xdd365b8b
//0xdd365b8b   

// 0xE7dc12C53437A2CB28c8f82386A40FB29c43A09c

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Delegate {

  address public owner;

  constructor(address _owner) public {
    owner = _owner;
  }

  function pwn() public {
    owner = msg.sender;
  }
}

contract Delegation {

  address public owner;
  Delegate delegate;

  constructor(address _delegateAddress) public {
    delegate = Delegate(_delegateAddress);
    owner = msg.sender;
  }

  fallback() external {
    (bool result,) = address(delegate).delegatecall(msg.data);
    if (result) {
      this;
    }
  }

    // function getfunc() public pure returns(bytes memory){
    //     address contractBAddress =  address(delegate);
    //     (bool success, bytes memory returndata) = contractBAddress.delegatecall(
    //         abi.encodeWithSelector(contractBAddress.pwn.selector,"")
    //     );

  //}
  
     function getfunc() public pure returns(bytes memory){
       return abi.encodeWithSignature("pwn()","");
  
}
}
//0xdd365b8b000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
//abi.encodeWithSelector(ContractB.setTokenName.selector, "BoringToken")