pragma solidity ^0.8.1;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract CoinFlip {

  using SafeMath for uint256;
  uint256 public consecutiveWins;
  uint256 lastHash;
  uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
                   

  constructor()  {
    consecutiveWins = 0;
  }

  function flip(bool _guess) public returns (bool) {
    uint256 blockValue = uint256(blockhash(block.number.sub(1)));

    if (lastHash == blockValue) {
      revert();
    }

    lastHash = blockValue;
    uint256 coinFlip = blockValue.div(FACTOR);
    bool side = coinFlip == 1 ? true : false;

    if (side == _guess) {
      consecutiveWins++;
      return true;
    } else {
      consecutiveWins = 0;
      return false;
    }
  }

  function gethash() public view returns(uint256){
      uint256 blockValue = uint256(blockhash(block.number.sub(1)));
      return blockValue;
  }

  function getblockhash() public view returns(bytes32){
     return blockhash(block.number.sub(1));
  }

function getPrevousblockNumber() public view returns(uint256){
  return block.number.sub(1);
}
  function getFlip() public view returns(bool){
     
    uint coinFlip = gethash()/FACTOR;
     bool side = coinFlip == 1 ? true : false;
    return side;
  }


}